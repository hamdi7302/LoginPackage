//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 15/9/2024.
//

import SwiftUI
 

//struct AutoScrollView: View {
//    @State private var offset: CGFloat = 0
//    @State private var currentIndex: Int = 0
//    let items = Array(0..<20) // Example items
//    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect() // Auto-scroll every 2 seconds
//    
//    
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack {
//                ForEach(items, id: \.self) { item in
//                    Text("Item \(item)")
//                        .frame(height: 100)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(10)
//                        .padding()
//                }
//            }
//        }
//        .onReceive(timer) { _ in
//            autoScroll()
//        }
//        .offset(y: -offset) // Apply offset to create scrolling effect
//        .animation(.easeInOut(duration: 10)) // Smooth animation for scroll
//    }
//    
//    private func autoScroll() {
//        let itemHeight: CGFloat = 120 // Item height + padding
//        let totalHeight = itemHeight * CGFloat(items.count)
//
//        offset += itemHeight
//        currentIndex += 1
//        
//        // Check if the scroll reached the end and reset
//        if offset >= totalHeight {
//            offset = 0
//            currentIndex = 0
//        }
//    }
//}

//struct AutoScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        AutoScrollView()
//    }
//}

//
//#Preview {
//    AutoScrollView()
//}
