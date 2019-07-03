//
//  CityList.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct CityList : View {
    
    let cities = Cities.availableCities!
    
    var body: some View {
        NavigationView {
            List(cities.identified(by: \.id)) { city in
                NavigationLink(destination: CityDetails(city: city)) {
                    CityRow(city: city)
                }
            }.listStyle(.grouped).navigationBarTitle(Text("Weather"))
        }
    }
}

#if DEBUG
struct CityList_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CityList().colorScheme(.light)
            CityList().colorScheme(.dark)
        }
    }
}
#endif
