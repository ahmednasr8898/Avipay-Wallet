//
//  AppError.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import Foundation

/// An enumeration representing different types of application errors.
/// - networkError: Indicates a network-related error.
/// - generic: Represents a generic error with an associated error message.
/// - unknown: Represents an unknown error.
enum AppError: Error, Equatable {
    case networkError
    case generic(String)
    case unknown
    
    /// A descriptive message for each error type.
    var description: String {
        switch self {
        case .networkError:
            return "Network error. Please try again."
        case .generic(let errorMessage):
            return errorMessage
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
