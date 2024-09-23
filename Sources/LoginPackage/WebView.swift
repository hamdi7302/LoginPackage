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
    var webViewObserver: NSKeyValueObservation?
    let wKWebView: WKWebView
    @StateObject var viewModel: LoginViewModel
    private var cancellables = Set<AnyCancellable>()

    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        
        self.wKWebView = WKWebView(frame: .zero)
       
        wKWebView.publisher(for: \.url)
            .sink { [ self] url in
                print(url)
                guard let url else {return }
                if (url.absoluteString.contains("allow")){
                    viewModel.userCurrentStep = .authenticated
                }
            }
            .store(in: &cancellables)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
 
        guard let step = viewModel.userCurrentStep, let userUrl = step.url else { return }
        
         
       
            wKWebView.load(URLRequest(url: userUrl))
   
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
 



