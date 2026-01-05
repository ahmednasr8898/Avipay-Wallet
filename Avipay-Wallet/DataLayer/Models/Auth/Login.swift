//
//  Login.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation

struct LoginRequestModel: Encodable {
    let phone: String
    let password: String
    
}

struct LoginResponseModel: Decodable {
    let token: String
}
