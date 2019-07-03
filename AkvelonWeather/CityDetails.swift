//
//  CityDetails.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct CityDetails : View {
    
    var city:City
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment:.center) {
                List() {
                    Image(self.city.image)
                        .resizable()
                        .frame(height:geometry.size.width*0.5)
                        .clipped()
                        .padding(.horizontal, -16)
                        .padding(.vertical, -8)
                    
                    ScrollView(showsIndicators: false) {
                        HStack(alignment: .center, spacing: 25) {
                            ForEach(self.city.day) { condition in
                                ConditionColomn(condition:condition)
                            }
                        }.frame(height:120)
                    }.frame(height:120)
                    
                    ForEach(self.city.conditions) { condition in
                        ConditionRow(condition:condition)
                    }
                }
            }
        }.navigationBarTitle(Text(city.name), displayMode: .inline)
    }
}

#if DEBUG
struct CityDetails_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CityDetails(city: Cities.availableCities!.first!).colorScheme(.light)
            CityDetails(city: Cities.availableCities!.first!).colorScheme(.dark)
        }
    }
}
#endif
