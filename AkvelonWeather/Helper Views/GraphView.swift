//
//  GraphView.swift
//  AkvelonWeather
//
//  Copyright © 2019 Akvelon. All rights reserved.
//

import SwiftUI
import Foundation

struct GraphView : View {
    
    var items:[Int]
    
    var body: some View {
        
        guard let maxNumber = items.max(),
            let minNumber = items.min()
        else {fatalError("Cant find maxValue")}
        let maxDifference = maxNumber - minNumber
        
        func percentage(for number:Int) -> Double {
            return Double(number - minNumber)/Double(maxDifference)
        }
        
        return
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(items.identified(by: \.self)) { number in
                    Rectangle()
                        .fill(Color(hue: 0.5*(percentage(for:number)+1), saturation: 0.85, brightness: 1))
                        .relativeHeight(Length((percentage(for:number) + 0.1)*0.9))
                }
            }
    }
}

#if DEBUG
struct GraphView_Previews : PreviewProvider {
    static var previews: some View {
        GraphView(items: [-6,-3,3,4,12,6,7,8,9,10,21,4,5,7,3,2,7,8,9,0,1,4,6,8,8])
    }
}
#endif
