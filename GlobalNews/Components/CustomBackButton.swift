//
//  CustomBackButton.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import Foundation
import SwiftUI

struct CustomBackButton : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var title: String = ""
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack (alignment: .center, spacing: 10) {
                Image(systemName: "chevron.backward")
                    .imageScale(.medium)
                
                Text(title)
            }
            .padding(.leading, 5)
            .foregroundColor(.black)
            .font(.system(size: 22).bold())
            
        })
    }
}
