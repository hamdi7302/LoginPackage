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
            
            Circle()
                .foregroundColor(.primary)
                .frame(width: 100)
                .padding(.vertical,8)
            
            Text("Welcome to App")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom,16)
                 
                
            Button(action: {
                viewModel.userCurrentStep = .creatingToken
            }) {
                Text("Authenticate")
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
                
            }) {
                Text("Enter as guest")
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
              
        }
    }
}

#Preview {
    MainLoginContent(viewModel: LoginViewModel())
}
