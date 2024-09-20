//
//  SwiftUIView.swift
//
//
//  Created by hamdi on 19/9/2024.
//

import SwiftUI
import UIKit
import WebKit
import Combine

struct WebView: UIViewRepresentable {
    @Environment(\.dismiss) var dismiss
    var webViewObserver: NSKeyValueObservation?
    let wKWebView: WKWebView
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.wKWebView = WKWebView(frame: .zero)
        wKWebView.publisher(for: \.url)
            .sink { [ self] url in
                guard let url else {return }
                if (url.absoluteString.contains("/authenticate/allow")){
                    dismiss()
                }
            }
            .store(in: &cancellables)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        wKWebView.load(URLRequest(url: URL(string: "https://www.themoviedb.org/authenticate/6212942fec63ada16f85763c67d075b9139b0aeb")!))
    }
    func makeUIView(context: Context) -> some UIView {
        return wKWebView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, WKUIDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}

#Preview {
    WebView()
}



