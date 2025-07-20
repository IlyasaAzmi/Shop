//
//  ProductRepository.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

protocol ProductRepository {
    func getProducts(limit: Int, skip: Int) async throws -> (products: [Product], total: Int)
}