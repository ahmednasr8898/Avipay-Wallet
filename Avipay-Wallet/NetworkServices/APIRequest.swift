//
//  APIRequest.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation


/// A protocol defining the structure of an API request.
protocol APIRequest {
    /// The expected response type for the request.
    associatedtype Response: Decodable
    /// The URL request to be sent.
    var urlRequest: URLRequest { get }
}
