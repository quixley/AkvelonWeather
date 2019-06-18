//
//  City.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI


struct City:Identifiable, Codable {
    var id:Int
    var name:String
    var country:String
    var image:String
    
    var day:[Condition]
    var conditions:[Condition]
    
}
