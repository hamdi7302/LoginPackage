//
//  SwiftUIView 2.swift
//
//
//  Created by hamdi on 17/9/2024.
//

import SwiftUI


// MARK: - View Extension for Sheet
public extension View {
    func loadfixedMdiumSheet<SheetContent: View>(userCurrentStep: Binding<UserCurrentStep?>, sheetContent: SheetContent) -> some View {
        return modifier(fixedMdiumSheet(userCurrentStep: userCurrentStep, sheetContent: sheetContent))
    }
}


// MARK: - Sheet Modifier
public struct fixedMdiumSheet<SheetContent: View>: ViewModifier {
    var userCurrentStep: Binding<UserCurrentStep?>
    var sheetContent: SheetContent
    @State var height : CGFloat = UIScreen.main.bounds.height
    @Environment(\.colorScheme) var colorScheme
    
  
    public  func body(content: Content) -> some View {
        
        ZStack{
            VStack{
                content
            }.ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer(minLength: 300)
                VStack(spacing: 0) {
                    sheetContent
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(((colorScheme == .dark) ? Color.black : Color.white)
                    .shadow(color: ((colorScheme == .dark) ? Color.black : Color.white),
                            radius: 30, x: 0, y: -50))
            }.ignoresSafeArea()
        }.ignoresSafeArea()
//            .background((colorScheme == .dark) ? Color.black : Color.white)
    }
}
