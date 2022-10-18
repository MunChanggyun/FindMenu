//
//  SettingDetail.swift
//  FindMenu
//
//  Created by mac on 2022/10/18.
//

import SwiftUI

struct SettingDetail: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Text("한식")
                }.buttonStyle(CustomButton())
                Button {
                    
                } label: {
                    Text("일식")
                }.buttonStyle(CustomButton())
                Button {
                    
                } label: {
                    Text("양식")
                }.buttonStyle(CustomButton())
                Button {
                    
                } label: {
                    Text("중식")
                }.buttonStyle(CustomButton())
            }
            HStack {
                Text("밥")
                Text("빵")
                Text("면")
                Text("국 및 찌개")
                Text("고기")
                Text("치킨")
                Text("분식")
                Text("패스트푸드")
            }
            HStack {
                Text("매운것") // 고추
                Text("느끼한것")
                Text("뜨꺼운것")
                Text("차가운것")
                Text("달달한것")
                Text("단짠단짠")
            }
        }
    }
}

struct SettingDetail_Previews: PreviewProvider {
    static var previews: some View {
        SettingDetail()
    }
}
