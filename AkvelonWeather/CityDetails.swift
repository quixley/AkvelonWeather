//
//  CityDetails.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct CityDetails : View {
    
    var city:City
    
    var body: some View {
        VStack(alignment: .center) {
            Image("card_back").resizable().aspectRatio(contentMode: .fill)
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(city.conditions!.identified(by: \.id)) { condition in
                        VStack(alignment:.center) {
                            Image(systemName:condition.type.systemImage)
                                .font(.largeTitle)
                                .padding(.bottom, 5)
                                .frame(width:40, height:40, alignment: .center)
                            Text(condition.temperature.displayValue).font(.headline)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    }
                }
            }.frame(height:70)
            Text("Powered by Akvelon").font(.footnote).color(.secondary).padding(.top, 10)
            Spacer()
        }.padding(.top,20).navigationBarTitle(Text(city.name), displayMode: .inline)
    }
}

#if DEBUG
struct CityDetails_Previews : PreviewProvider {
    static var previews: some View {
        CityDetails(city: Cities.availableCities!.first!).colorScheme(.light)
    }
}
#endif
