//
//  AvipayErrorAlert.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import SwiftUI

/// A reusable error alert view for displaying error messages with a retry option.
/// - Parameters:
///  - title: The title of the error alert.
///  - message: The message of the error alert.
///  - retryAction: The action to perform when the retry button is tapped.
///
struct AvipayErrorAlert: View {
    let title: String
    let message: String
    let retryAction: () -> Void

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 16) {
                Spacer().frame(height: 28)

                Text(title)
                    .font(.heading3)
                    .foregroundColor(.onSurfaceAvipay)

                Text(message)
                    .font(.caption)
                    .foregroundColor(.textBoxAvipay)
                    .multilineTextAlignment(.center)

                Button(action: retryAction) {
                    Text("Ok")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 42)
                        .background(.criticalAvipay)
                        .cornerRadius(12)
                        .font(.button)
                }
                .padding(.top, 8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 20)
            .frame(maxWidth: 300)

            Circle()
                .fill(Color.red)
                .frame(width: 56, height: 56)
                .overlay(
                    Image(systemName: "exclamationmark")
                        .foregroundColor(.white)
                        .font(.title)
                )
                .offset(y: -28)
        }
    }
}


#Preview {
    AvipayErrorAlert(title: "Error Occurred", message: "Something went wrong while processing your request. Please try again.", retryAction: {})
}
