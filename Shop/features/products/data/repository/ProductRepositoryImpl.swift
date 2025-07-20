//
//  ProductRepositoryImpl.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

class ProductRepositoryImpl: ProductRepository {
    private let baseURL = "https://dummyjson.com"
    
    func getProducts(limit: Int, skip: Int) async throws -> (products: [Product], total: Int) {
        guard let url = URL(string: "\(baseURL)/products?limit=\(limit)&skip=\(skip)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        
        let products = response.products.map { $0.toDomain() }
        return (products: products, total: response.total)
    }
}
