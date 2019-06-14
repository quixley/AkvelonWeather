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
                ScrollView(alwaysBounceVertical: true) {
                    VStack(alignment: .center) {
                        Image(uiImage: image).resizable().aspectRatio(contentMode: .fill).frame(height:200).clipped()
                        ScrollView(showsHorizontalIndicator: false) {
                            HStack(alignment: .top, spacing: 10) {
                                ForEach(self.city.conditions) { condition in
                                    ConditionColomn(condition:condition)
                                }
                            }
                            }.frame(height:70)
                        Text("Powered by Akvelon")
                            .font(.footnote)
                            .color(.gray)
                            .padding(.top, 10)
                    }.frame(width: geometry.size.width)
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
