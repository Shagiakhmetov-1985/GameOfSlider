//
//  SliderUIKit.swift
//  GameOfSlider
//
//  Created by Marat Shagiakhmetov on 14.06.2021.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    @Binding var value: Float
    
    let alpha: Int
    let color: UIColor
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumTrackTintColor = .blue
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float.random(in: 0...100)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(value: .constant(50), alpha: 100, color: .red)
    }
}
