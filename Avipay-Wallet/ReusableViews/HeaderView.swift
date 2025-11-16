//
//  HeaderView.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 16/11/2025.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let backAction: () -> Void

    
    var body: some View {
        VStack{
            HStack {
                Button {
                    backAction()
                } label: {
                    Image("back")
                        .frame(width: 24, height: 24)
                        .scaledToFit()
                }
                Spacer()
                Text(title)
                    .font(.heading3)
                    .foregroundStyle(.onSurfaceAvipay)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(8)
            }
            .padding()
        }
    }
}

#Preview {
    HeaderView(title: "Hello", backAction: {  })
}
