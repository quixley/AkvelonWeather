//
//  CityRow.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct CityRow : View {
    var city: City
    var body: some View {
        let currentCondition = city.day.first!
        return HStack {
            ConditionImage(conditionType: city.day.first!.type)
                .padding(.leading, 16)
                .font(.title)
                .frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading) {
                Text(city.name)
                    .font(.headline)
                    .color(.primary)
                Text(city.country)
                    .font(.body)
                    .color(.secondary)
            }.padding(.leading, 5)
            Spacer()
            Text(currentCondition.temperature.displayValue)
                .padding(.trailing, 16)
                .font(.largeTitle)
        }.accessibility(label: Text("It's currently \(currentCondition.type.conditionText) in \(city.name) with temperature of \(currentCondition.temperature.displayValue)"))
    }
}

#if DEBUG
struct CityRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CityRow(city: Cities.availableCities!.first!).previewLayout(.fixed(width: 320, height: 60))
            CityRow(city: Cities.availableCities!.randomElement()!).previewLayout(.fixed(width: 375, height: 60))
            CityRow(city: Cities.availableCities!.last!).previewLayout(.fixed(width: 600, height: 60))
        }
    }
}
#endif
