//
//  ShopListViewModel.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

@MainActor
class ShopListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var hasMoreItems = true
    @Published var errorMessage: String?
    
    private let getProductsUseCase: GetProductsUseCase
    private let itemsPerPage = 10
    private var totalItems = 0
    
    init(getProductsUseCase: GetProductsUseCase) {
        self.getProductsUseCase = getProductsUseCase
    }
    
    func loadInitialProducts() {
        guard products.isEmpty else { return }
        loadMoreProducts()
    }
    
    func loadMoreProducts() {
        guard !isLoading && hasMoreItems else { return }
        
        isLoading = true
        errorMessage = nil
        
        let skip = products.count
        
        Task {
            do {
                let result = try await getProductsUseCase.execute(limit: itemsPerPage, skip: skip)
                
                products.append(contentsOf: result.products)
                totalItems = result.total
                hasMoreItems = products.count < totalItems
                
            } catch {
                errorMessage = "Failed to load products: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
    
    func shouldLoadMore(for product: Product) -> Bool {
        guard let lastProduct = products.last else { return false }
        return product.id == lastProduct.id && hasMoreItems && !isLoading
    }
}