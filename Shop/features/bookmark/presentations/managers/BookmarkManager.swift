//
//  BookmarkManager.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

@MainActor
class BookmarkManager: ObservableObject {
    static let shared = BookmarkManager()
    
    @Published private var bookmarkRepository: BookmarkRepositoryImpl
    
    private init() {
        self.bookmarkRepository = BookmarkRepositoryImpl()
    }
    
    var bookmarks: [Product] {
        bookmarkRepository.getAllBookmarks()
    }
    
    var bookmarkCount: Int {
        bookmarkRepository.getBookmarkCount()
    }
    
    func toggleBookmark(_ product: Product) {
        if isBookmarked(product) {
            bookmarkRepository.removeBookmark(product)
        } else {
            bookmarkRepository.addBookmark(product)
        }
        notifyBookmarkChanged()
    }
    
    func isBookmarked(_ product: Product) -> Bool {
        bookmarkRepository.isBookmarked(product)
    }
    
    func addBookmark(_ product: Product) {
        bookmarkRepository.addBookmark(product)
        notifyBookmarkChanged()
    }
    
    func removeBookmark(_ product: Product) {
        bookmarkRepository.removeBookmark(product)
        notifyBookmarkChanged()
    }
    
    private func notifyBookmarkChanged() {
        objectWillChange.send()
        NotificationCenter.default.post(name: NSNotification.Name("BookmarkChanged"), object: nil)
    }
}