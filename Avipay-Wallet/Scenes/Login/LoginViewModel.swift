//
//  LoginViewModel.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var isSavePasswordSelected: Bool = false
    @Published var loginState: ViewState<String> = .idle
    
    var isButtonEnabled: Bool {
        AvipayTextFieldValidator.validate(.phone, text: phone) &&
        AvipayTextFieldValidator.validate(.password, text: password)
    }
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepositoryImpl(apiClient: APIClient())) {
        self.authRepository = authRepository
    }
    
    func login() async {
        self.loginState = .loading
        do {
            let response = try await authRepository.login(requet: LoginRequestModel(phone: phone,
                                                                                    password: password))
            self.loginState = .success(response.token)
        } catch {
            self.loginState = .failure(.generic(error.localizedDescription))
        }
    }
}
    
