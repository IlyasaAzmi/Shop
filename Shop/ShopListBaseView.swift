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
                if viewModel.isLoading && viewModel.products.isEmpty {
                    // Show 3 skeleton cards during initial loading
                    ForEach(0..<3, id: \.self) { _ in
                        SkeletonCardView()
                    }
                } else {
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

                }

                Spacer()
                    .frame(height: 72)
            }
            .frame(maxWidth: .infinity)
        }
        .refreshable {
            viewModel.refreshProducts()
        }
        .onAppear {
            viewModel.loadInitialProducts()
        }
        .alert("Error", isPresented: $viewModel.showAlert) {
            Button("Retry") {
                if viewModel.products.isEmpty {
                    viewModel.loadInitialProducts()
                } else {
                    viewModel.loadMoreProducts()
                }
            }

            Button("Not Now", role: .cancel) {
                // Do nothing - just dismiss the alert
            }
        } message: {
            Text(viewModel.errorMessage ?? "An unknown error occurred")
        }
    }

    var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer(minLength: 40)

            Text("Shop")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Casual Shop Experience")
                .font(.system(size: 16, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 30)
        }
        .padding(.horizontal, 16)
    }
}
