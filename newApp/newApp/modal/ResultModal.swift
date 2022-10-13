//
//  ResultModal.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI

struct ResultModal: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("modal page")
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Text("다시 선택")
            }

        }
    }
}

struct ResultModal_Previews: PreviewProvider {
    static var previews: some View {
        ResultModal()
    }
}
