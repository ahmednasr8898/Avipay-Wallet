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
    @State private var isSavePasswordSelected = false
    
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
            
            HStack {
                HStack(spacing: 4) {
                    Button {
                        isSavePasswordSelected.toggle()
                    } label: {
                        Image(systemName: isSavePasswordSelected ? "checkmark.square.fill" : "app")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color.primaryAvipay)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.surfaceAvipay)
                    )
                    
                    Text("Save password")
                        .font(.caption2)
                        .foregroundStyle(Color.onSurfaceAvipay)
                }
                Spacer()
                
                Button {
                    // Tapped on forgot password.
                } label: {
                    Text("Forgot password?")
                        .font(.caption2)
                        .foregroundStyle(Color.primaryAvipay)
                }

            }
            .padding(.top, 10)
            .padding(.horizontal, 24)
            
            
            Button(action: {
                // Tapped on login
            }, label: {
                Text(" Login")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            })
            .buttonStyle(.normal)
            .padding(.top, 40)
            .padding(.horizontal, 24)
            
            HStack(spacing: 4) {
                Text("Don’t have account?")
                    .font(.bodyText)
                    .foregroundStyle(Color.onSurfaceAvipay)

                
                Button {
                    // Tapped on sign up
                } label: {
                    Text("Sign Up")
                        .font(.bodyText)
                        .foregroundStyle(Color.primaryAvipay)
                }
            }
            .padding(.top, 16)
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
