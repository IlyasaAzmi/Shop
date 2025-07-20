//
//  GetProductsUseCase.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

protocol GetProductsUseCase {
    func execute(limit: Int, skip: Int) async throws -> (products: [Product], total: Int)
}

class GetProductsUseCaseImpl: GetProductsUseCase {
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func execute(limit: Int, skip: Int) async throws -> (products: [Product], total: Int) {
        return try await repository.getProducts(limit: limit, skip: skip)
    }
}