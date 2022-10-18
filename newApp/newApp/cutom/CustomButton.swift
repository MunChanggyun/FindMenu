//
//  CustomButton.swift
//  FindMenu
//
//  Created by mac on 2022/10/18.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    var backgroundColor: Color?
    var forgroundColor: Color?
    var radius: CGFloat?
    
    init() {
        
    }
    
    init (backgroundColor: Color, forgroundColor: Color, radius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.forgroundColor = forgroundColor
        self.radius = radius
    }
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor ?? Color.blue)
            .foregroundColor(forgroundColor ?? Color.white)
            .scaleEffect(configuration.isPressed ? 1.4 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .cornerRadius(radius ?? 0.0)
    }
}
