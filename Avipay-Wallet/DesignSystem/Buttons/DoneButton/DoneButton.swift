//
//  DoneButton.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 10/11/2025.
//

import SwiftUI


struct DoneButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .font(.button)
            .background(Color.successAvipay)
            .foregroundColor(Color.white)
            .cornerRadius(12)
    }
}

extension ButtonStyle where Self == DoneButtonStyle {
    static var done: Self { Self() }
}
