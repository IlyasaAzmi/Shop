//
//  ProductResponse.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

struct ProductResponse: Codable {
    let products: [ProductDTO]
    let total: Int
    let skip: Int
    let limit: Int
}

struct ProductDTO: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let thumbnail: String
}

extension ProductDTO {
    func toDomain() -> Product {
        return Product(
            id: id,
            title: title,
            description: description,
            price: price,
            thumbnail: thumbnail
        )
    }
}