//
//  CityList.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct CityList : View {
    
    let cities = Cities.availableCities!
    
    var body: some View {
        NavigationView {
            List(cities.identified(by: \.id)) { city in
                NavigationButton(destination: CityDetails(city: city)) {
                    CityRow(city: city)
                }
            }.navigationBarTitle(Text("Weather"))
        }    
    }
}

#if DEBUG
struct CityList_Previews : PreviewProvider {
    static var previews: some View {
        CityList().colorScheme(.dark)
    }
}
#endif
