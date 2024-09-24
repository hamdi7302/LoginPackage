//
//  File.swift
//
//
//  Created by hamdi on 22/9/2024.
//

import Foundation

public enum UserCurrentStep: Identifiable{
    case creatingToken
    case authenticated
    
    public var id: String {
        switch self {
        case .creatingToken:
            return "creatingToken"
        case .authenticated:
            return "authenticated"
        }
    }
}

