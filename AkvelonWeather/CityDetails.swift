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
        
        guard let image = UIImage(named: city.image) else {
            fatalError("Image not found")
        }
        
        return
            GeometryReader { geometry in
                VStack(alignment:.center) {
                    List() {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(image.size.width/image.size.height, contentMode: .fill)
                            .frame(height:geometry.size.width*0.5)
                            .clipped()
                            .padding(.horizontal, -16)
                            .padding(.vertical, -8)
                        
                        ScrollView(alwaysBounceHorizontal:true, showsHorizontalIndicator: false) {
                            HStack(alignment: .center, spacing: 25) {
                                ForEach(self.city.day) { condition in
                                    ConditionColomn(condition:condition)
                                }
                            }.frame(height:120)
                        }.frame(height:120)
                        
                        ForEach(self.city.conditions) { condition in
                            HStack(alignment: .center) {
                                Text("\(condition.id+1) June")
                                Spacer()
                                ConditionImage(conditionType: condition.type)
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                Spacer()
                                Text("\(condition.temperature.value)")
                                    .font(.title)
                                Text("\(condition.temperature.value - 7)")
                                    .font(.title)
                                    .color(.secondary)
                                    .frame(minWidth: 40, idealWidth: 50, maxWidth: 60)
                                    .aspectRatio(contentMode: .fit)
                            }.padding(.vertical, 5)
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
