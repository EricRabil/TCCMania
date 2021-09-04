////  TCCIntent.swift
//  TCCMania
//
//  Created by Eric Rabil on 9/4/21.
//  
//

import Foundation
import SwiftCLI

enum TCCIntent: String, ConvertibleFromString {
    case grant
    case revoke
    case reset
    
    var bool: Bool? {
        switch self {
        case .grant:
            return true
        case .revoke:
            return false
        case .reset:
            return nil
        }
    }
}
