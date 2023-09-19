//
//  DetailAricleView.swift
//  GlobalNews
//
//  Created by mymac on 19/09/23.
//

import SwiftUI

struct DetailAricleView: View {
    
    var url: String
    
    var body: some View {
        WebView(urlString: url)
    }
}
