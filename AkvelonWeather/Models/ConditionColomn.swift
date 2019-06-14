//
//  ConditionColomn.swift
//  AkvelonWeather
//
//  Created by Artur Akvelon on 14.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct ConditionColomn : View {
    var condition:Condition
    var body: some View {
        VStack(alignment:.center) {
            Image(systemName:condition.type.systemImage)
                .font(.largeTitle)
                .padding(.bottom, 5)
                .frame(width:40, height:40, alignment: .center)
            Text(condition.temperature.displayValue).font(.headline)
        }.padding(.horizontal, 20)
        
    }
}

#if DEBUG
struct ConditionColomn_Previews : PreviewProvider {
    static var previews: some View {
        ConditionColomn(condition: Cities.availableCities!.first!.currentCondition)
    }
}
#endif
