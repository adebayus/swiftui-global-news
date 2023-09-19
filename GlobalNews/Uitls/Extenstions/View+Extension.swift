//
//  View+Extension.swift
//  GlobalNews
//
//  Created by mymac on 17/09/23.
//

import Foundation
import SwiftUI

extension View {
    func toast(isPresented: Binding<Bool>, message: String, duration: TimeInterval) -> some View {
        ZStack(alignment: .bottom) {
            self
            if isPresented.wrappedValue {
                ToastView(message: message, duration: duration, isPresented: isPresented)
                    .animation(.easeInOut)
            }
        }
    }
}

