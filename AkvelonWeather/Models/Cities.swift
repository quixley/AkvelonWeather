//
//  Cities.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import Foundation

struct Cities:Codable {
    
    var cities:[City]?
    
}

extension Cities {
    static let availableCities:[City]? = {
        if let path = Bundle.main.path(forResource: "Cities", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                var response:Cities?
                do {
                    response = try JSONDecoder().decode(Cities.self, from: data)
                } catch {
                    print("Parsing error: \(error)")
                }
                
                return response?.cities
            }
        }
        return nil
    }()
}
