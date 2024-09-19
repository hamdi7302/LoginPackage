//
//  SwiftUIView.swift
//
//
//  Created by hamdi on 14/9/2024.
//
//  SwiftUIView.swift
//  Created by hamdi on 14/9/2024.

import SwiftUI
import Combine

public struct LoginUIView: View {
    
    public init(){}
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    public var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.items.indices, id: \.self) { rowIndex in
                            VStack {
                                ForEach(viewModel.items[rowIndex], id: \.self.id) { colIndex in
                                    ScrollViewCards(movieIndex: colIndex.value)
                                        .id(colIndex.value)
                                        
                                }
                            }
                        }
                    }
                }.rotationEffect(.degrees(180))
                 
            }.allowsHitTesting(false)
                .loadfixedMdiumSheet(isPresented: $viewModel.showLoginSteps, sheetContent:{MainLoginContent(viewModel: viewModel)}())
                .ignoresSafeArea()
            Spacer()
        }
        
        .ignoresSafeArea()
            .onAppear(perform: {
                viewModel.startTimer()
            })
    }
}

#Preview {
    LoginUIView()
}
