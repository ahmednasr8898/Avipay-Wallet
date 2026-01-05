//
//  OnboardingView.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 10/11/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                Image("onboarding")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 326)
                
                VStack(spacing: 12) {
                    Image("wallet")
                    
                    VStack(spacing: 14) {
                        Text("Avipay!")
                            .font(.heading3)
                            .foregroundStyle(.onSurfaceAvipay)
                        
                        Text("Consumer Loan Payment, pay bills \nand many other services")
                            .font(.caption)
                            .foregroundStyle(.secondaryAvipay)
                            .multilineTextAlignment(.center)
                            .lineSpacing(6)
                    }
                }
                
                Button(action: {
                    navigateToLogin = true
                }, label: {
                    Text(" Get Started")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                })
                .buttonStyle(.normal)
                
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
            
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
                    .toolbar(.hidden, for: .navigationBar)
                
            }
        }
    }
}

#Preview {
    OnboardingView()
}
