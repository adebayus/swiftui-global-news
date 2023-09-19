//
//  CustomSearchBar.swift
//  GlobalNews
//
//  Created by mymac on 18/09/23.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                TextField("Search Sources", text: $searchText)
                    .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 2)
            )
        }
        
    }
}
