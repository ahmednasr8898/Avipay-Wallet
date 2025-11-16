//
//  InputFieldType.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 16/11/2025.
//

import SwiftUI

/// Types of input fields
/// - phone: Phone number input
/// - username: Username input
/// - password: Password input
/// - confirmPassword: Confirm password input
enum InputFieldType {
    case phone
    case username
    case password
    case confirmPassword
    
    /// - Returns the placeholder text for each input field type.
    var placeholder: String {
        switch self {
        case .phone: return "Phone number"
        case .username: return "Username"
        case .password: return "Password"
        case .confirmPassword: return "Confirm password"
        }
    }

    /// - Returns whether the input field is secure (for passwords).
    var isSecure: Bool {
        self == .password || self == .confirmPassword
    }

    /// - Returns the appropriate keyboard type for the input field.
    var keyboardType: UIKeyboardType {
        self == .phone ? .phonePad : .default
    }

}
