//
//  BookmarkUseCases.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

protocol ToggleBookmarkUseCase {
    func execute(_ product: Product)
}

protocol GetBookmarksUseCase {
    func execute() -> [Product]
}

protocol IsBookmarkedUseCase {
    func execute(_ product: Product) -> Bool
}

class ToggleBookmarkUseCaseImpl: ToggleBookmarkUseCase {
    private let repository: BookmarkRepository
    
    init(repository: BookmarkRepository) {
        self.repository = repository
    }
    
    func execute(_ product: Product) {
        if repository.isBookmarked(product) {
            repository.removeBookmark(product)
        } else {
            repository.addBookmark(product)
        }
    }
}

class GetBookmarksUseCaseImpl: GetBookmarksUseCase {
    private let repository: BookmarkRepository
    
    init(repository: BookmarkRepository) {
        self.repository = repository
    }
    
    func execute() -> [Product] {
        return repository.getAllBookmarks()
    }
}

class IsBookmarkedUseCaseImpl: IsBookmarkedUseCase {
    private let repository: BookmarkRepository
    
    init(repository: BookmarkRepository) {
        self.repository = repository
    }
    
    func execute(_ product: Product) -> Bool {
        return repository.isBookmarked(product)
    }
}