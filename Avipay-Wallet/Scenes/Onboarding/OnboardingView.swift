//
//  OnboardingView.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 10/11/2025.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        
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
                ///Action
            }, label: {
                Text(" Get Started")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            })
            .buttonStyle(.normal)
            
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
    }
}

#Preview {
    OnboardingView()
}
