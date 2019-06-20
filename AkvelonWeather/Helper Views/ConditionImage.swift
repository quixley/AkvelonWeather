//
//  ConditionImage.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI

struct ConditionImage : View {
    
    var conditionType:ConditionType
    
    var body: some View {
        Image(systemName:conditionType.systemImage)
            .foregroundColor(conditionType.imageColor)
    }
}

#if DEBUG
struct ConditionImage_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ConditionImage(conditionType: .clear)
            ConditionImage(conditionType: .clouds)
        }
    }
}
#endif
