//
//  GenericErrorOverlay.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import SwiftUI

/// A view modifier that presents an error overlay when `isPresented` is true.
/// - Parameters:
///  - isPresented: A binding to a Boolean value that determines whether the error overlay is presented
///  - title: The title of the error alert.
///  - message: The message of the error alert.
struct ErrorOverlayModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    let message: String

    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isPresented)

            if isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)

                AvipayErrorAlert(
                    title: title,
                    message: message,
                    retryAction: {
                        isPresented = false
                    }
                )
                .transition(.scale.combined(with: .opacity))
                .zIndex(1)
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}


extension View {
    func errorOverlay(isPresented: Binding<Bool>, title: String = "Error", message: String) -> some View {
        self.modifier(ErrorOverlayModifier(isPresented: isPresented, title: title, message: message))
    }
}
