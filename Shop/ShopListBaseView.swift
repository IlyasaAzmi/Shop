//
//  ShopListBaseView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ShopListBaseView: View {
    let dummyUrl: String = "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"
    
    @State private var displayedItems: [Int] = []
    @State private var isLoading = false
    @State private var hasMoreItems = true
    
    private let itemsPerPage = 10
    private let totalItems = 100
    
    var body: some View {
        ScrollView {
            headerView

            LazyVStack(spacing: 10) {
                ForEach(displayedItems, id: \.self) { index in
                    ProductCardView(dummyUrl: dummyUrl, index: index)
                        .onAppear {
                            if index == displayedItems.last && hasMoreItems && !isLoading {
                                loadMoreItems()
                            }
                        }
                }
                
                if isLoading {
                    VStack {
                        ProgressView()
                            .scaleEffect(0.8)
                        Text("Loading more items...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 16)
                }

                Spacer()
                    .frame(height: 72)
            }
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            if displayedItems.isEmpty {
                loadMoreItems()
            }
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
    
    private func loadMoreItems() {
        guard !isLoading && hasMoreItems else { return }
        
        isLoading = true
        
        // Simulate API call delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let currentCount = displayedItems.count
            let nextBatch = currentCount..<min(currentCount + itemsPerPage, totalItems)
            
            displayedItems.append(contentsOf: Array(nextBatch))
            
            // Check if we've reached the end
            hasMoreItems = displayedItems.count < totalItems
            isLoading = false
        }
    }
}
