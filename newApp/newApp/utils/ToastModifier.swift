//
//  Toast.swift
//  FindMenu
//
//  Created by mac on 2022/11/15.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
        @State private var workItem: DispatchWorkItem?
        
        func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    ZStack {
                        mainToastView()
                            .offset(y: -30)
                    }.animation(.spring(), value: toast)
                )
                .onChange(of: toast) { value in
                    showToast()
                }
        }
        
        @ViewBuilder func mainToastView() -> some View {
            if let toast = toast {
                VStack {
                    Spacer()
                    CustomToast(
                        toastType: toast.type, toastText: toast.message)
                }
                .transition(.move(edge: .bottom))
            }
        }
        
        private func showToast() {
            guard let toast = toast else { return }
            
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            
            workItem?.cancel()
            
            let task = DispatchWorkItem {
               dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: task)
        }
        
        private func dismissToast() {
            withAnimation {
                toast = nil
            }
            
            workItem?.cancel()
            workItem = nil
        }
}

extension View {
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
