////  main.swift
//  TCCMania
//
//  Created by Eric Rabil on 9/4/21.
//  
//

import Foundation
import SwiftCLI

class TCCMania: Command {
    let name = "tcc-mania"
    
    let longDescription: String = """
        manipulate the TCC database from the command-line
        
        list of services:
        \(TCCService.allCases.map(\.rawValue).map { "- \($0)" }.joined(separator: "\n"))
        
        AMFI must be disabled as this requires the private entitlement com.apple.private.tcc.manager
        
        Examples:
        
        tcc-mania grant camera -p /Applications/Brave\\ Browser.app
        tcc-mania revoke microphone -i com.hnc.Discord
        tcc-mania reset photos -p /Applications/Twitter.app
        """
    
    @Param
    var intent: TCCIntent
    
    @Key("-p", "--path", description: "Path to the executable to set TCC access for")
    var path: String?
    
    @Key("-i", "--bundle-id", description: "Path to the bundle ID to set TCC access for")
    var bundleID: String?
    
    @Param
    var service: TCCService
    
    func target() throws -> AccessTarget {
        if let path = path {
            return .path(path)
        } else if let bundleID = bundleID {
            return .bundleID(bundleID)
        } else {
            throw AccessTarget.AccessTargetError.invalidTarget
        }
    }
    
    func execute() throws {
        print(try self.target().apply(service: service, granted: intent.bool))
    }
}

CLI(singleCommand: TCCMania()).goAndExit()
