//
//  StateViewEnum.swift
//  Avipay-Wallet
//
//  Created by Ahmed Khalil, Vodafone on 25/12/2025.
//


import Foundation

/// An enumeration representing the state of a view.
enum ViewState<T> {
    /// - idle: The view is in an idle state.
    case idle
    /// - loading: The view is currently loading data.
    case loading
    /// - success: The view has successfully loaded data of type T.
    case success(T)
    /// - failure: The view has encountered an error of type AppError.
    case failure(AppError)
}

