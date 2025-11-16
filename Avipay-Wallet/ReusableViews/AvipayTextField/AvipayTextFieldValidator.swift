//
//  AvipayTextFieldValidator.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 16/11/2025.
//

import SwiftUI

/// - Validator for AvipayTextFieldView input fields.
struct AvipayTextFieldValidator {
    /// - Validates the input text based on the field type.
    /// - Parameters:
    ///   - type: The type of input field.
    ///   - text: The input text to validate.
    ///   - confirmPassword: Optional binding for confirm password field (used for confirmPassword type
    static func validate(_ type: InputFieldType,
                         text: String,
                         confirmPassword: Binding<String>? = nil) -> Bool {
        switch type {
        case .phone:
            return text.count == 11

        case .username:
            return text.count >= 3

        case .password:
            return text.count >= 6

        case .confirmPassword:
            /// - Ensure confirmPassword binding is provided and matches the password.
            ///  - Returns false if either field is empty.
            guard let confirm = confirmPassword?.wrappedValue,
                !text.isEmpty,
                !confirm.isEmpty
            else { return false }

            return text == confirm
        }
    }
}
