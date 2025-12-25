//
//  LoginViewModel.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var isSavePasswordSelected: Bool = false
    @Published  var loginState: ViewState<String> = .idle
    

    func login() {
        loginState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loginState = .failure(.generic("General error"))
        }
    }
}
    
