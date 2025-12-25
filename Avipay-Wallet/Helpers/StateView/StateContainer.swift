//
//  StateContainer.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import SwiftUI


/// A SwiftUI view that manages and displays different states (loading, success, failure) of its content.
/// - Parameters:
///  - Content: The type of view to be displayed as content.
///  - T: The type of data associated with the success state.
///  - state: A binding to the current state of the view.
///  - content: A closure that takes an optional data of type T and returns the content view.
struct StateContainer<Content: View, T>: View {
    @Binding var state: ViewState<T>
    let content: (T?) -> Content

    var body: some View {
        ZStack {
            /// The main content view, disabled when loading or in an error state.
            content(currentData)
                .disabled(isLoading || hasError)

            /// Loading indicator overlay.
            if isLoading {
                Color.black.opacity(0.2).ignoresSafeArea()
                VStack(spacing: 16) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .primaryAvipay))
                        .scaleEffect(1.5)
                }
                .frame(width: 120, height: 90)
                .background(.white)
                .cornerRadius(12)
                .shadow(radius: 10)
            }

            /// Error alert overlay.
            if let error = currentError {
                Color.black.opacity(0.4).ignoresSafeArea()
                AvipayErrorAlert(
                    title: "Failed",
                    message: error.description,
                    retryAction: { dismissError() }
                )
            }
        }
    }

    /// Computed property to check if the current state is loading.
    private var isLoading: Bool {
        if case .loading = state { return true }
        return false
    }

    /// Computed property to check if the current state is an error.
    private var hasError: Bool {
        if case .failure = state { return true }
        return false
    }

    /// Computed property to get the current error if the state is failure.
    private var currentError: AppError? {
        if case .failure(let error) = state { return error }
        return nil
    }

    /// Computed property to get the current data if the state is success.
    private var currentData: T? {
        if case .success(let data) = state { return data }
        return nil
    }

    /// Dismisses the error state and resets to idle.
    private func dismissError() {
        state = .idle
    }
}
