//
//  AvipayTextFieldView.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 16/11/2025.
//

import SwiftUI

/// A reusable text field view with validation and visibility toggle for passwords
///
struct AvipayTextFieldView: View {
    /// - title: The title of the text field.
    let title: String
    /// - type: The type of input field (phone, username, password, confirmPassword).
    let type: InputFieldType
    /// - text: The binding text value.
    @Binding var text: String
    /// - confirmPasswordText: The binding text value for confirming password (only for confirmPassword type).
    var confirmPasswordText: Binding<String>? = nil
    /// - isPasswordVisible: State to toggle password visibility.
    @State private var isPasswordVisible = false
    /// - isValid: Computed property to check if the input is valid based on the type.
    private var isValid: Bool {
        AvipayTextFieldValidator.validate(type, text: text, confirmPassword: confirmPasswordText)
    }
    
    // MARK: - Title Label
    /// - The title label view.
    private var titleLabel: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.secondaryAvipay)
    }
    
    // MARK: - Input Field
    /// - The main input field view, which switches between secure and regular text fields based on the type and visibility state.
    @ViewBuilder
    private var inputField: some View {
        if type.isSecure {
            if isPasswordVisible {
                TextField(type.placeholder, text: $text)
            } else {
                SecureField(type.placeholder, text: $text)
            }
        } else {
            TextField(type.placeholder, text: $text)
                .keyboardType(type.keyboardType)
        }
    }
    
    // MARK: - Eye Button
    /// - Button to toggle password visibility
    @ViewBuilder
    private var eyeButton: some View {
        if type.isSecure {
            Button { isPasswordVisible.toggle() } label: {
                Image(isPasswordVisible ? "eye-show" : "eye-hide")
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Checkmark Icon
    /// - Checkmark icon to indicate valid input
    @ViewBuilder
    private var checkmarkIcon: some View {
        if isValid {
            Image("check")
                .foregroundColor(.green)
        }
    }
    
    // MARK: - Background View
    /// - Background view with dynamic styling based on validity
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(isValid ? Color.primaryAvipay : Color.borderNorAvipay,
                    lineWidth: isValid ? 2 : 1)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isValid ? Color.surfacePrimaryAvipay : Color.surfaceAvipay)
            )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            titleLabel
            
            HStack {
                inputField
                eyeButton
                checkmarkIcon
            }
            .padding(.horizontal, 12)
            .frame(height: 50)
            .background(backgroundView)
        }
    }
}
