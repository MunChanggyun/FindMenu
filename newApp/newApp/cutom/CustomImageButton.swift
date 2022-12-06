//
//  CustomImageButton.swift
//  FindMenu
//
//  Created by mac on 2022/10/20.
//

import SwiftUI

struct CustomImageButton: View {
    var name: String
    @State var size: CGFloat
    @State var isPress: Bool = false
    var buttonAction = {}
    
    // @escaping :: 함수를 외부에서 변수형태로 사용하기 위해서 사용된다.
    
    init(_ name: String, size: CGFloat = 50, action buttonAction: @escaping () -> Void = {}) {
        self.name = name
        self.size = size
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button {
            buttonAction()
            
            isPress = !isPress
            
            if isPress {
                size = size + 10
            } else {
                size = size - 10
            }
            
        } label: {
            Image(name)
                .resizable()
                .frame(width: size, height: size)
                
        }.buttonStyle(CustomImageButtonStyle(paddingEdges: .all, paddingSize: 5))
    }
}

struct CustomImageButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageButton("korea", size: 50)
    }
}
