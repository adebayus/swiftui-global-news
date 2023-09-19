//
//  WebView.swift
//  GlobalNews
//
//  Created by mymac on 19/09/23.
//

import SwiftUI
import WebKit

// UIViewRepresentable to wrap a UIKit WebView
struct WebView: UIViewControllerRepresentable {
    let urlString: String

    func makeUIViewController(context: Context) -> UIViewController {
        let webView = WKWebView()
        let viewController = UIViewController()
        viewController.view = webView
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        print(URL(string: urlString), urlString, "asdasd1")
        
        if let webView = uiViewController.view as? WKWebView, let url = URL(string: urlString) {
            print(url, "asdasd")
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
