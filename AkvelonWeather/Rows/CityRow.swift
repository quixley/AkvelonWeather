//
//  CityRow.swift
//  AkvelonWeather
//
//  Created by Arthur Mikhaylov on 13.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct CityRow : View {
    var city: City
    var body: some View {
        HStack {
            Image(systemName: city.currentCondition!.type.systemImage)
                .padding(.leading, 16)
                .font(.title).foregroundColor(.yellow).frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading) {
                Text(city.name).font(.headline).color(.primary)
                Text(city.country).font(.footnote).color(.secondary)
            }.padding(.leading, 5)
            Spacer()
            Text(city.currentCondition!.temperature.displayValue)
                .padding(.trailing, 16).font(.largeTitle)
        }
    }
}

#if DEBUG
struct CityRow_Previews : PreviewProvider {
    static var previews: some View {
        CityRow(city: Cities.availableCities!.first!).previewLayout(.fixed(width: 320, height: 60))
    }
}
#endif
