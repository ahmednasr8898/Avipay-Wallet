//
//  LoginView.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 10/11/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var phone: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Login") {
                // Back action
            }
            
            VStack(spacing: 28) {
                
                AvipayTextFieldView(title: "Phone", type: .phone, text: $phone)
                
                AvipayTextFieldView(title: "Password", type: .password, text: $password)
            }
            
            .padding([.horizontal, .top], 24)
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
