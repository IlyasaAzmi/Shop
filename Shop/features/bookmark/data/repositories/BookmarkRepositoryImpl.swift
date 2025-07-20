//
//  BookmarkRepositoryImpl.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

class BookmarkRepositoryImpl: BookmarkRepository, ObservableObject {
    @Published private var bookmarks: [Product] = []
    
    func addBookmark(_ product: Product) {
        if !bookmarks.contains(where: { $0.id == product.id }) {
            bookmarks.append(product)
        }
    }
    
    func removeBookmark(_ product: Product) {
        bookmarks.removeAll { $0.id == product.id }
    }
    
    func isBookmarked(_ product: Product) -> Bool {
        return bookmarks.contains(where: { $0.id == product.id })
    }
    
    func getAllBookmarks() -> [Product] {
        return bookmarks
    }
    
    func getBookmarkCount() -> Int {
        return bookmarks.count
    }
}