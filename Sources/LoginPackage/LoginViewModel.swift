//
//  File.swift
//
//
//  Created by hamdi on 17/9/2024.
//

import Foundation
import SwiftUI
import Combine
import NetworkingPackage

private var cancellables = Set<AnyCancellable>()

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
    @Published var userCurrentStep: UserCurrentStep? = nil
    @Published var openUrlSheet: Bool = false
    let authNetworkManager = AuthNetworkManager()
    var timer: AnyCancellable?
    
    
    init() {
        handleUserStqteChqnges()
    }
    
    func handleUserStqteChqnges () {
        $userCurrentStep
             
            .sink { [weak self] usersCurrentStep  in
            switch usersCurrentStep {
            case .creatingToken:
                // create temp token
                self?.createRequestToken()
            case .waitingForUserApproval(let uRL):
                self?.openUrlSheet = true
                self?.stopTimer()
            case .authenticated:
                // after approval in webview create a newValid user session
                self?.openUrlSheet = false
                self?.createUserSession()
                self?.startTimer()
                break
            default: break
            }
        }.store(in: &cancellables)
    }
    
    func createRequestToken(){
        
        authNetworkManager.createRequestToken()
            .receive(on: DispatchQueue.main)
            .sink { error in
                // show alert
            } receiveValue: { [weak self] res in
                guard let url = URL(string: "https://www.themoviedb.org/authenticate/\(res.request_token)") else {return}
                AuthManager.shared.setAuthToken(res.request_token)
                self?.userCurrentStep = .waitingForUserApproval(url)
               
            }.store(in: &cancellables)
        
    }
    
    func createUserSession (){
        authNetworkManager.createUserSession().sink { res in
            
        } receiveValue: { value in
            print(value)
        }.store(in: &cancellables)

    }
    
    // MARK: - Animation
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
    
    func updateItems () {
        items.enumerated().map { index, array in
            let item = ItemWithID(value: array.last!.value)
            withAnimation(.linear(duration: 15)) {
                items[index].insert( item,at: 0)
                items[index].removeLast()
            }
        }
    }
    
    func stopTimer() {
        timer?.cancel() // Cancel the timer to stop receiving events
    }
    
    deinit {
        stopTimer() // Ensure the timer is canceled when the object is deallocated
    }
}

