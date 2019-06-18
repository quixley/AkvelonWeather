//
//  Temperature.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import Foundation

struct Temperature:Codable {
    var value:Int
    
}

extension Temperature {
    var displayValue:String {
        return "\(value) ºC"
    }
}
