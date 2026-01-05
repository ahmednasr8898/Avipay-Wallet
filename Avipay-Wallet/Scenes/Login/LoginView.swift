//
//  LoginView.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 10/11/2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
         /// A container that manages different states of the login process
        StateContainer(state: $viewModel.loginState) { data in
            /// The main content of the login view
            ZStack {
                VStack(spacing: 0) {
                    HeaderView(title: "Login") {
                        // Handle back action
                    }
                    
                    VStack(spacing: 28) {
                        AvipayTextFieldView(title: "Phone", type: .phone, text: $viewModel.phone)
                        AvipayTextFieldView(title: "Password", type: .password, text: $viewModel.password)
                    }
                    .padding([.horizontal, .top], 24)
                    
                    HStack {
                        HStack(spacing: 4) {
                            Button {
                                viewModel.isSavePasswordSelected.toggle()
                            } label: {
                                Image(systemName: viewModel.isSavePasswordSelected ? "checkmark.square.fill" : "app")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(Color.primaryAvipay)
                            }
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.surfaceAvipay))
                            
                            Text("Save password")
                                .font(.caption2)
                                .foregroundStyle(Color.onSurfaceAvipay)
                        }
                        Spacer()
                        Button {
                            // Handle forgot password action
                        } label: { Text("Forgot password?").font(.caption2).foregroundStyle(Color.primaryAvipay) }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 24)
                    
                    Button(action: {  Task { await viewModel.login() } }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(viewModel.isButtonEnabled ? .white : .gray)
                    }
                    .buttonStyle(.normal)
                    .padding(.top, 40)
                    .disabled(!viewModel.isButtonEnabled)
                    .padding(.horizontal, 24)
                    
                    if let model = data {
                        // Here you can navigate to the next screen or show success message
                        Text("Success! Token: \(model)")
                            .foregroundColor(.green)
                    }
                    
                    HStack(spacing: 4) {
                        Text("Don’t have account?")
                            .font(.bodyText)
                            .foregroundStyle(Color.onSurfaceAvipay)
                        
                        Button {
                            // Handle sign up action
                        } label: { Text("Sign Up").font(.bodyText).foregroundStyle(Color.primaryAvipay) }
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
