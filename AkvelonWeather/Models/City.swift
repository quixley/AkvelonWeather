//
//  City.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI


struct City:Identifiable, Codable {
    var id:Int
    var name:String
    var country:String
    
    var conditions:[Condition]?
    var currentCondition:Condition?
    
}