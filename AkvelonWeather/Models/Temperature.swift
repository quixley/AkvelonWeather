//
//  Temperature.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
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
