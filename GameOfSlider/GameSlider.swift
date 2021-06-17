//
//  GameSlider.swift
//  GameOfSlider
//
//  Created by Marat Shagiakhmetov on 17.06.2021.
//

import SwiftUI

struct GameSlider: View {
    @Binding var currentValue: Float
    
    let targerValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targerValue)")
            HStack {
                Text("0")
                SliderUIKit(value: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(currentValue: .constant(50), targerValue: 100, color: .red, alpha: 100)
    }
}
