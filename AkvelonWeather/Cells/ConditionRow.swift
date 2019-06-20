//
//  ConditionRow.swift
//  AkvelonWeather
//
//  Created by Artur Akvelon on 19.06.2019.
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct ConditionRow : View {
    
    var condition:Condition
    
    var body: some View {
        HStack(alignment: .center) {
            Text("\(condition.id+1) June")
            Spacer()
            ConditionImage(conditionType: condition.type)
                .font(.body)
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

#if DEBUG
struct ConditionRow_Previews : PreviewProvider {
    static var previews: some View {
        ConditionRow(condition: Condition(id: 0, temperature: Temperature(value: 12), type: .storm))
    }
}
#endif
