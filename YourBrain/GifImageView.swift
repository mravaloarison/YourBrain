//
//  GifImageView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import SwiftUI
import WebKit

struct GifImageView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

#Preview {
    GifImageView(url: URL(string:"https://giphy.com/embed/EkHbiqD1yu6Wc")!)
}
