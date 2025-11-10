//
//  NormalButton.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 09/11/2025.
//

import SwiftUI


struct NormalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .font(.button)
            .background(Color.primaryAvipay)
            .foregroundColor(Color.white)
            .cornerRadius(12)
    }
}

extension ButtonStyle where Self == NormalButtonStyle {
    static var normal: Self { Self() }
}
