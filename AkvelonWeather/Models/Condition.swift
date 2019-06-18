//
//  Condition.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import Foundation
import SwiftUI

enum ConditionType:Int, CaseIterable, Codable {
    case clear = 0
    case clouds
    case rain
    case storm
    case snow
    
    var systemImage:String {
        switch self {
        case .clear:
            return "sun.max"
        case .clouds:
            return "cloud.sun"
        case .rain:
            return "cloud.sun.rain"
        case .storm:
            return "cloud.sun.bolt"
        case .snow:
            return "cloud.snow"
        }
    }
    
    var imageColor:Color {
        switch self {
        case .clear:
            return .yellow
        case .clouds:
            return .gray
        case .rain:
            return .blue
        case .storm:
            return .orange
        case .snow:
            return .accentColor
        }
    }
    
    var conditionText:String {
        switch self {
        case .clear:
            return "Clear"
        case .clouds:
            return "Cloudy"
        case .rain:
            return "Rainy"
        case .storm:
            return "Stormy"
        case .snow:
            return "Snowy"
        }
    }
}

struct Condition:Codable, Identifiable {
    var id:Int
    var temperature:Temperature
    var type:ConditionType
    
}

extension Condition {
    var hourString:String {
        if id == 0 {return "Now"}
        let hour = id + 1
        let suffix = hour >= 12 && hour < 24 ? "PM" : "AM"
        let actualHour = hour > 12 ? hour - 12 : hour
        return "\(actualHour) \(suffix)"
    }
}
