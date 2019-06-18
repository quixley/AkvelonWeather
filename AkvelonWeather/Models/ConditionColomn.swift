//
//  ConditionColomn.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct ConditionColomn : View {
    var condition:Condition
    var body: some View {
        VStack(alignment:.center) {
            Text(condition.hourString)
                .font(.subheadline)
            ConditionImage(conditionType: condition.type)
                .font(.title)
                .padding(.bottom, 5)
                .frame(width:40, height:40, alignment: .center)
            Text(condition.temperature.displayValue)
                .font(.headline)
        }.padding(.vertical,.zero)
        
    }
}

#if DEBUG
struct ConditionColomn_Previews : PreviewProvider {
    static var previews: some View {
        ConditionColomn(condition: Cities.availableCities!.first!.day.first!)
    }
}
#endif
