//
//  Main.swift
//  newApp
//
//  Created by chang gyun Mun on 2022/10/10.
//

import SwiftUI

struct Main: View {
    @State private var showModal = false
    @State private var isShowLoading = true
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    ProgressView().hidden(isShowLoading)
                }
                
                VStack {
                    Button {
            //                self.showModal = true
                        isShowLoading = !isShowLoading
                        print("show madal")
                    } label: {
                        Text("선택 !!")
                    }.sheet(isPresented: self.$showModal) {
                        ResultModal()
                    }

                    
                }
            }
            
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
