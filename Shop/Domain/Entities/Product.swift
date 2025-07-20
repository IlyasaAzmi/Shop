//
//  Product.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

struct Product: Identifiable, Equatable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let thumbnail: String
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}