//
//  WebView.swift
//  Desserts
//
//  Created by Bryce Cullen on 6/25/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView  {
        WKWebView(frame: .zero)
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let urlStruct = URL(string: url) else {
            return
        }

        let urlLoadRequest = URLRequest(url: urlStruct)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(urlLoadRequest)
    }
}
