//
//  NetworkError.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation

/// An enumeration representing network-related errors.
enum NetworkError: Error {
    /// - invalidURL: Indicates that the URL is invalid.
    case invalidURL
    /// - invalidResponse: Indicates that the response from the server is invalid.
    case invalidResponse
    /// - serverError: Represents a server error with an associated status code.
    case serverError(statusCode: Int)
    /// - decodingError: Indicates an error occurred while decoding the response data.
    case decodingError
}
