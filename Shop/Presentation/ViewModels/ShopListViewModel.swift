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
    @Published var isRefreshing = false
    @Published var hasMoreItems = true

    @Published var showAlert: Bool = false
    @Published var errorMessage: String?
    
    private let getProductsUseCase: GetProductsUseCase
    private let itemsPerPage = 10
    private var totalItems = 0
    
    init(getProductsUseCase: GetProductsUseCase) {
        self.getProductsUseCase = getProductsUseCase
    }
    
    func loadInitialProducts() {
        guard products.isEmpty else { return }
        
        Task {
            await loadProducts(skip: 0, isInitialLoad: true)
        }
    }

    func loadMoreProducts() {
        guard !isLoading && !isRefreshing && hasMoreItems else { return }
        
        isLoading = true
        let skip = products.count
        
        Task {
            await loadProducts(skip: skip, isInitialLoad: false)
            isLoading = false
        }
    }
    
    func refreshProducts() {
        guard !isRefreshing && !isLoading else { return }
        
        isRefreshing = true
        
        Task {
            await loadProducts(skip: 0, isInitialLoad: true)
            isRefreshing = false
        }
    }
    
    private func loadProducts(skip: Int, isInitialLoad: Bool) async {
        clearErrorState()
        
        do {
            let result = try await getProductsUseCase.execute(limit: itemsPerPage, skip: skip)
            
            if isInitialLoad {
                products = result.products
            } else {
                products.append(contentsOf: result.products)
            }
            
            totalItems = result.total
            hasMoreItems = products.count < totalItems
            
        } catch {
            handleError(error)
        }
    }
    
    private func clearErrorState() {
        showAlert = false
        errorMessage = nil
    }
    
    private func handleError(_ error: Error) {
        errorMessage = "Failed to load products: \(error.localizedDescription)"
        showAlert = true
    }
    
    func shouldLoadMore(for product: Product) -> Bool {
        guard let lastProduct = products.last else { return false }
        return product.id == lastProduct.id && hasMoreItems && !isLoading
    }
}
