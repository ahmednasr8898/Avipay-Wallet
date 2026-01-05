//
//  AuthRepository.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation


protocol AuthRepository {
    func login(requet: LoginRequestModel) async throws -> LoginResponseModel
}

final class AuthRepositoryImpl: AuthRepository {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func login(requet: LoginRequestModel) async throws -> LoginResponseModel {
        let request = LoginAPIRequest(body: requet)
        return try await apiClient.send(request)

    }
}
