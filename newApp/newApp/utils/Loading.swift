//
//  Loading.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ProgressView{
            Label("선택중 입니다.", systemImage: "")
        }
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
