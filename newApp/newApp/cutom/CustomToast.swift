//
//  Toast.swift
//  FindMenu
//
//  Created by mac on 2022/11/15.
//

import SwiftUI

struct CustomToast: View {
    var toastType: ToastEnum
    var toastText: String
    
    var body: some View {
        VStack{
            HStack{
                toastType.getToastIcon()
                    .font(Font.system(size: 20.0, weight: .semibold))
                Text(toastText).foregroundColor(toastType.themeColor)
                    .font(Font.system(size: 20.0, weight: .semibold))
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            
            .background(Color("toastBackground").opacity(0.4))
            .cornerRadius(10)
            
        }
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        CustomToast(toastType: .error, toastText: "테스트1")
    }
}
