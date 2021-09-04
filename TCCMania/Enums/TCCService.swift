////  TCCService.swift
//  TCCMania
//
//  Created by Eric Rabil on 9/4/21.
//  
//

import Foundation
import SwiftCLI

public enum TCCService: String, CaseIterable, ConvertibleFromString {
    case addressBook
    case calendar
    case reminders
    case twitter
    case facebook
    case sinaWeibo
    case liverpool
    case ubiquity
    case tencentWeibo
    case photos
    case photosAdd
    case shareKit
    case microphone
    case camera
    case willow
    case mediaLibrary
    case siri
    
    var bridgedValue: String {
        switch self {
        case .addressBook: return "kTCCServiceAddressBook"
        case .calendar: return "kTCCServiceCalendar"
        case .reminders: return "kTCCServiceReminders"
        case .twitter: return "kTCCServiceTwitter"
        case .facebook: return "kTCCServiceFacebook"
        case .sinaWeibo: return "kTCCServiceSinaWeibo"
        case .liverpool: return "kTCCServiceLiverpool"
        case .ubiquity: return "kTCCServiceUbiquity"
        case .tencentWeibo: return "kTCCServiceTencentWeibo"
        case .photos: return "kTCCServicePhotos"
        case .photosAdd: return "kTCCServicePhotosAdd"
        case .shareKit: return "kTCCServiceShareKit"
        case .microphone: return "kTCCServiceMicrophone"
        case .camera: return "kTCCServiceCamera"
        case .willow: return "kTCCServiceWillow"
        case .mediaLibrary: return "kTCCServiceMediaLibrary"
        case .siri: return "kTCCServiceSiri"
        }
    }
}
