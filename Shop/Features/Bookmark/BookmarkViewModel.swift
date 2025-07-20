//
//  BookmarkViewModel.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

@MainActor
class BookmarkViewModel: ObservableObject {
    @Published var bookmarks: [Product] = []
    
    private let getBookmarksUseCase: GetBookmarksUseCase
    private let bookmarkManager = BookmarkManager.shared
    
    init(getBookmarksUseCase: GetBookmarksUseCase) {
        self.getBookmarksUseCase = getBookmarksUseCase
        loadBookmarks()
        
        // Listen to bookmark changes
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name("BookmarkChanged"),
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.loadBookmarks()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func loadBookmarks() {
        bookmarks = bookmarkManager.bookmarks
    }
    
    func removeBookmark(_ product: Product) {
        bookmarkManager.removeBookmark(product)
        loadBookmarks()
    }
}