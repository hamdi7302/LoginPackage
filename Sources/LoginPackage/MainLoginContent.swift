//
//  SwiftUIView 2.swift
//  
//
//  Created by hamdi on 17/9/2024.
//

import SwiftUI

struct MainLoginContent: View {
    @StateObject var viewModel: LoginViewModel
  
 
    var body: some View {
        VStack(spacing: 8) {
            Text("Welcome to App")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom,16)
                .inversedForegroundColor()
                
            Button(action: {}) {
                Text("Sign up")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundColor(.white)
            }
            
            Button(action: {
//                viewModel.items[0].swapAt(viewModel.items[0].startIndex, viewModel.items[0].endIndex - 1)
//                print(viewModel.items)
            }) {
                Text("Sign in")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(25)
                    .padding(.horizontal)
                    .foregroundColor(.white)
            }
            
            Text("By clicking the Sign up button below, I certify that I have read and agree to the terms of use and privacy policy.")
                .multilineTextAlignment(.center)
                .font(.caption)
                .padding([.top, .horizontal])
                .padding(.bottom)
                .inversedForegroundColor()
        }
    }
}

#Preview {
    MainLoginContent(viewModel: LoginViewModel())
}
