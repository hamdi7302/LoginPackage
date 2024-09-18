//
//  SwiftUIView 2.swift
//
//
//  Created by hamdi on 17/9/2024.
//

import SwiftUI


// MARK: - View Extension for Sheet
public extension View {
    func loadfixedMdiumSheet<SheetContent: View>(isPresented: Binding<Bool>, sheetContent: SheetContent) -> some View {
        return modifier(fixedMdiumSheet(isPresented: isPresented, sheetContent: sheetContent))
    }
}


// MARK: - Sheet Modifier
public struct fixedMdiumSheet<SheetContent: View>: ViewModifier {
    var isPresented: Binding<Bool>
    var sheetContent: SheetContent
    @State var height : CGFloat = UIScreen.main.bounds.height
    public func body(content: Content) -> some View {
        
        ZStack{
            VStack{
                content
            }.ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer()
                VStack(spacing: 0) {
                    Circle()
                        .inversedForegroundColor()
                        .frame(width: 100)
                        .padding(.vertical,8)
                    sheetContent
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.primary.shadow(color: .primary, radius: 30, x: 0, y: -50))
            }.ignoresSafeArea()
        }.ignoresSafeArea()
            .background(Color.primary)
    }
}
