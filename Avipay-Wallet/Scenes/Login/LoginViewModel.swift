//
//  LoginViewModel.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import Foundation

enum AppError: Error {
    case networkError
    case generic(String)
    case unknown
    
    var description: String {
        switch self {
        case .networkError:
            return "Network error. Please try again."
        case .generic(let errorMessage):
            return errorMessage
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case failure(AppError)
}


struct LoginResponse {
    let token: String
}


class LoginViewModel: ObservableObject {
    
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var isSavePasswordSelected: Bool = false
    
    @Published private var loginState: ViewState<LoginResponse> = .idle
    
    func getLoginState() -> ViewState<LoginResponse> {
        return loginState
    }
    
    /// - Validates the login form inputs.
    ///
    ///
    
    func login() {
        loginState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loginState = .failure(.generic("General error"))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.loginState = .success(LoginResponse(token: "New token"))
            }
        }
        
        
    }
}
    
