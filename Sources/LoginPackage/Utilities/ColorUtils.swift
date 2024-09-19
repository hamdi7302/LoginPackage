//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 18/9/2024.
//

import SwiftUI
// MARK: - Random Color Extension Just for test Card Scroll i will remoe it lter
public extension Color {
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

struct BackgroundColorInversed: ViewModifier{
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.background((colorScheme == .dark ? .black : .white))
    }
}

extension View {
    func inversedBackgoundColor() -> some View {
        modifier(BackgroundColorInversed())
    }
}
