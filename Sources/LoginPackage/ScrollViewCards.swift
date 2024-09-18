//
//  File.swift
//  
//
//  Created by hamdi on 17/9/2024.
//

import Foundation
import SwiftUI

struct ScrollViewCards: View {
    var movieIndex: Int
    
    var body: some View {
        VStack(spacing: 0){
            Image("movie\(movieIndex)")
                .resizable()
                .frame(width: (UIScreen.main.bounds.width / 3 - 10),height: ((UIScreen.main.bounds.width / 3) * CGFloat.random(in: 1.10...1.45)))
                .cornerRadius(12)
                .rotationEffect(Angle(degrees: 180))
        }
    }
}


