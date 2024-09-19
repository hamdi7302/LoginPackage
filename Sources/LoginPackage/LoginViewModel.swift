//
//  File.swift
//
//
//  Created by hamdi on 17/9/2024.
//

import Foundation
import SwiftUI
import Combine

struct ItemWithID: Identifiable {
   let id = UUID()  // This will automatically generate a unique ID for each item
   let value: Int
}

class LoginViewModel: ObservableObject {

    @Published var items: [[ItemWithID]] = [
        Array(1...6).map { ItemWithID(value: $0) },
        Array(7...12).map { ItemWithID(value: $0) },
        Array(13...18).map { ItemWithID(value: $0) }
    ]
    @Published var showLoginSteps: Bool = true
    var timer: AnyCancellable?

    func updateItems () {
        items.enumerated().map { index, array in
            let item = ItemWithID(value: array.last!.value)
            withAnimation(.linear(duration: 15)) {
                items[index].insert( item,at: 0)
                items[index].removeLast()
            }
        }
    }
    func startTimer() {
        DispatchQueue.main.async {
            self.updateItems()
        }
        timer = Timer.publish(every: 15, on: .current, in: .default)
            .autoconnect()  // Automatically starts emitting values when subscribed
            .sink { [self] _ in
                updateItems()
            }
    }
    
    func stopTimer() {
         timer?.cancel() // Cancel the timer to stop receiving events
     }
     
     deinit {
         stopTimer() // Ensure the timer is canceled when the object is deallocated
     }
}

