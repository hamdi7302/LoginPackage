//
//  File.swift
//
//
//  Created by hamdi on 22/9/2024.
//

import Foundation

public enum UserCurrentStep: Identifiable{
    case creatingToken
    case waitingForUserApproval(URL)
    case authenticated
    
    public var id: String {
        switch self {
        case .creatingToken:
            return "creatingToken"
        case .waitingForUserApproval(let uRL):
            return "waitingForUserApproval "
        case .authenticated:
            return "authenticated"
        }
    }
    
    public var url: URL?{
        if case let .waitingForUserApproval(url) = self {
            return  url
        }
        return nil
    }
}

