//
//  Condition.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
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
}

struct Condition:Codable, Identifiable {
    var id:Int
    var temperature:Temperature
    var type:ConditionType
    
}
