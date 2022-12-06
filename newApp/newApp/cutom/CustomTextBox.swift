    //
//  CustomTextBox.swift
//  FindMenu
//
//  Created by mac on 2022/11/10.
//

import SwiftUI

struct CustomTextBox: View {
    @State var isHover: Bool = false
    var content: String = ""
    var clickAction = {}
    var boxColorSet: [Color] = [Color("box_blue"), Color("box_green"), Color("box_navy"), Color("box_pink"), Color("box_red"), Color("box_yellow")]
    
    init(content: String) {
        self.content = content
    }
    
    init(content: String, action clickAction: @escaping () -> Void = {}) {
        self.content = content
        self.clickAction = clickAction
    }
    
    var body: some View {
        HStack {
            Text(content)
                .font(Font.system(size: 20.0, weight: .bold))
                
            if isHover {
                Image(systemName: "xmark").onTapGesture {
                    clickAction()
                }
            }
        }
        .onTapGesture {
            self.isHover.toggle()
        }
        .padding(10).background(boxColorSet.randomElement()).foregroundColor(Color.white).cornerRadius(10.0)
            
            
    }
}

struct CustomTextBox_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextBox(content: "마라탕")
    }
}
