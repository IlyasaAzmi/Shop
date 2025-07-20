//
//  ShopListBaseView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ShopListBaseView: View {
    @StateObject private var viewModel = ShopListViewModel(
        getProductsUseCase: GetProductsUseCaseImpl(
            repository: ProductRepositoryImpl()
        )
    )

    var body: some View {
        ScrollView {
            headerView

            LazyVStack(spacing: 10) {
                ForEach(viewModel.products) { product in
                    ProductCardView(product: product)
                        .onAppear {
                            if viewModel.shouldLoadMore(for: product) {
                                viewModel.loadMoreProducts()
                            }
                        }
                }
                
                if viewModel.isLoading {
                    VStack {
                        ProgressView()
                            .scaleEffect(0.8)
                        Text("Loading more items...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 16)
                }
                
                if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text("Error: \(errorMessage)")
                            .font(.caption)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                        
                        Button("Retry") {
                            viewModel.loadMoreProducts()
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .padding()
                }

                Spacer()
                    .frame(height: 72)
            }
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            viewModel.loadInitialProducts()
        }
    }

    var headerView: some View {
        VStack(spacing: 8) {
            Spacer(minLength: 40)

            Text("Shop")
                .font(.system(size: 36, weight: .light, design: .rounded))

            Text("Casual Shop Experience")
                .font(.system(size: 16, weight: .regular))

            Spacer(minLength: 30)
        }
        .frame(height: 160)
    }
}
