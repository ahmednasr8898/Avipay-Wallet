//
//  Endpoint.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation


/// A protocol defining the structure of an API endpoint.
protocol Endpoint {
    /// The base URL of the API.
    var baseURL: String { get }
    /// The path of the endpoint.
    var path: String { get }
    /// The HTTP method used for the request.
    var method: HTTPMethod { get }
    /// The headers for the request.
    var headers: [String: String]? { get }
    /// The body of the request.
    var body: Encodable? { get }
}
