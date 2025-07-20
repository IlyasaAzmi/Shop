//
//  BookmarkView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct BookmarkView: View {
    @StateObject private var viewModel = BookmarkViewModel(
        getBookmarksUseCase: GetBookmarksUseCaseImpl(
            repository: BookmarkRepositoryImpl()
        )
    )
    
    var body: some View {
        ScrollView {
            headerView
            
            LazyVStack(spacing: 10) {
                if viewModel.bookmarks.isEmpty {
                    emptyStateView
                } else {
                    ForEach(viewModel.bookmarks) { product in
                        ProductCardView(product: product)
                    }
                }
                
                Spacer()
                    .frame(height: 72)
            }
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            viewModel.loadBookmarks()
        }
    }
    
    var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer(minLength: 40)
            
            Text("Bookmarks")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Your saved products")
                .font(.system(size: 16, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer(minLength: 30)
        }
        .padding(.horizontal, 16)
    }
    
    var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "bookmark.slash")
                .font(.system(size: 48))
                .foregroundColor(.gray)
            
            Text("No Bookmarks Yet")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Start exploring products and bookmark your favorites!")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .padding(.top, 80)
    }
}