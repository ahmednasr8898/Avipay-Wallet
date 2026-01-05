//
//  NetworkService.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation

/// A service responsible for making network requests.
final class NetworkService {

    static let shared = NetworkService()
    private init() {}

    /// Makes a network request to the specified endpoint and decodes the response.
    /// - Parameters:
    ///  - endpoint: The endpoint to which the request is made.
    ///  - responseType: The type of the expected response.
    ///  - Returns: The decoded response of the specified type.
    func request<T: Decodable>(
        endpoint: Endpoint,
        responseType: T.Type
    ) async throws -> T {

        /// A wrapper to encode any Encodable type.
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            throw NetworkError.invalidURL
        }

        /// Construct the URLRequest.
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers

        /// Encode the request body if present.
        if let body = endpoint.body {
            /// Use AnyEncodable to encode the body.
            request.httpBody = try JSONEncoder().encode(AnyEncodable(body))
            /// Set the Content-Type header.
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        /// Perform the network request.
        let (data, response) = try await URLSession.shared.data(for: request)

        /// Validate the response.
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        /// Check for successful status codes.
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }

        /// Decode the response data.
        do {
            /// Decode the data into the expected type.
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            /// Handle decoding errors.
            throw NetworkError.decodingError
        }
    }
}
