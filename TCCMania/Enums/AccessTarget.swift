////  AccessTarget.swift
//  TCCMania
//
//  Created by Eric Rabil on 9/4/21.
//  
//

import Foundation

let TCC = dlopen("/System/Library/PrivateFrameworks/TCC.framework/TCC", RTLD_NOW)

enum WeakLinkError: Error {
    case symbolNotFound(name: String)
}

func link<P>(_ name: String) throws -> P {
    guard let symbol = dlsym(TCC, name) else {
        throw WeakLinkError.symbolNotFound(name: name)
    }
    
    if P.self is AnyObject.Type {
        return symbol.assumingMemoryBound(to: P.self).pointee
    } else {
        return unsafeBitCast(symbol, to: P.self)
    }
}

typealias _TCCAccessSetForPath = @convention(c) (CFString, CFString, DarwinBoolean) -> DarwinBoolean
typealias _TCCAccessSetForBundleID = @convention(c) (CFString, CFString, DarwinBoolean) -> DarwinBoolean

typealias _TCCAccessResetForPath = @convention(c) (CFString, CFString) -> DarwinBoolean
typealias _TCCAccessResetForBundleID = @convention(c) (CFString, CFString) -> DarwinBoolean

let TCCAccessSetForPath: _TCCAccessSetForPath = try! link("TCCAccessSetForPath")
let TCCAccessSetForBundleID: _TCCAccessSetForBundleID = try! link("TCCAccessSetForBundleId")
let TCCAccessResetForPath: _TCCAccessResetForPath = try! link("TCCAccessResetForPath")
let TCCAccessResetForBundleID: _TCCAccessResetForBundleID = try! link("TCCAccessResetForBundleId")

enum AccessTarget {
    enum AccessTargetError: Error {
        case invalidTarget
    }
    
    case path(String)
    case bundleID(String)
    
    func apply(service: TCCService, granted: Bool?) -> Bool {
        switch self {
        case .path(let path):
            switch granted {
            case .some(let granted):
                return TCCAccessSetForPath(service.bridgedValue as CFString, path as CFString, .init(granted)).boolValue
            case .none:
                return TCCAccessResetForPath(service.bridgedValue as CFString, path as CFString).boolValue
            }
        case .bundleID(let bundleID):
            switch granted {
            case .some(let granted):
                return TCCAccessSetForBundleID(service.bridgedValue as CFString, bundleID as CFString, .init(granted)).boolValue
            case .none:
                return TCCAccessResetForBundleID(service.bridgedValue as CFString, bundleID as CFString).boolValue
            }
        }
    }
}
