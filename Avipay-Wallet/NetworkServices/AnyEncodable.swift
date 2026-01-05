//
//  AnyEncodable.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 05/01/2026.
//

import Foundation


/// A type-erased Encodable value.
struct AnyEncodable: Encodable {
    /// The function that encodes the wrapped value.
    private let encodeFunc: (Encoder) throws -> Void

    /// Initializes a new AnyEncodable instance wrapping the given Encodable value.
    init<T: Encodable>(_ wrapped: T) {
        encodeFunc = wrapped.encode
    }

    /// Encodes the wrapped value using the provided encoder.
    func encode(to encoder: Encoder) throws {
        try encodeFunc(encoder)
    }
}
