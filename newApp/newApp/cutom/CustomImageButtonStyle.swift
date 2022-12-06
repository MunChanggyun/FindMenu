//
//  CustomButton.swift
//  FindMenu
//
//  Created by mac on 2022/10/18.
//

import SwiftUI

struct CustomImageButtonStyle: ButtonStyle {
    var backgroundColor: Color?
    var forgroundColor: Color?
    var radius: CGFloat?
    var paddingEdges: Edge.Set?
    var paddingSize: CGFloat?
    
    init (backgroundColor: Color = Color.clear, forgroundColor: Color = Color.black, radius: CGFloat = 0, paddingEdges: Edge.Set = .all, paddingSize: CGFloat = 0) {
        self.backgroundColor = backgroundColor
        self.forgroundColor = forgroundColor
        self.radius = radius
        self.paddingEdges = paddingEdges
        self.paddingSize = paddingSize
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(paddingEdges ?? .all, paddingSize ?? 10)
            .background(backgroundColor ?? nil)
            .foregroundColor(forgroundColor ?? Color.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .cornerRadius(radius ?? 0.0)
    }
}
