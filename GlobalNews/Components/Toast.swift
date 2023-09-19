//
//  Toast.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import SwiftUI

struct ToastView: View {
    let message: String
    let duration: TimeInterval
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text(message)
                .padding()
                .background(Color.black.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                withAnimation {
                    isPresented = false
                }
            }
        }
        .transition(.move(edge: .top))
    }
}
