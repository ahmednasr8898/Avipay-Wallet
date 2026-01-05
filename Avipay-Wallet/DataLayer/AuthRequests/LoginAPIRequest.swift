//
//  LoginAPIRequest.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation

struct LoginAPIRequest: APIRequest {

    typealias Response = LoginResponseModel

    private let body: LoginRequestModel

    init(body: LoginRequestModel) {
        self.body = body
    }

    var urlRequest: URLRequest {
        var request = URLRequest(
            url: URL(string: "https://3889e11e-0747-48cb-8021-9caa240ee2fb.mock.pstmn.io/login")!
        )
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        return request
    }
}
