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
        
        guard let image = UIImage(named: city.image) else {
            fatalError("Image not found")
        }
        
        return
            GeometryReader { geometry in
                VStack (alignment: .leading) {
                    ScrollView(alwaysBounceVertical: false) {
                        VStack(alignment: .center) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(image.size.width/image.size.height, contentMode: .fill)
                                .frame(height:geometry.size.width*0.75)
                                .relativeWidth(1)
                                .clipped()
                            ScrollView(alwaysBounceHorizontal:true, showsHorizontalIndicator: false) {
                                HStack(alignment: .top, spacing: 10) {
                                    ForEach(self.city.conditions) { condition in
                                        ConditionColomn(condition:condition)
                                    }
                                }.padding(.top, 10)
                            }.frame(height:80)
                            Divider().padding(.bottom, 20)
                            GraphView(items: self.city.conditions.map {$0.temperature.value})
                                .padding(.horizontal, 0)
                                .frame(width:geometry.size.width, height:200)
                        }.frame(width: geometry.size.width)
                    }
                    Text("Powered by Akvelon")
                        .font(.footnote)
                        .color(.gray)
                        .padding(.top, 10)
                }
            }.navigationBarTitle(Text(city.name), displayMode: .inline)
        
    }
}

#if DEBUG
struct CityDetails_Previews : PreviewProvider {
    static var previews: some View {
        CityDetails(city: Cities.availableCities!.first!).colorScheme(.light)
    }
}
#endif
