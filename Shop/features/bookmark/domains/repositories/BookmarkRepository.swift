//
//  BookmarkRepository.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import Foundation

protocol BookmarkRepository {
    func addBookmark(_ product: Product)
    func removeBookmark(_ product: Product)
    func isBookmarked(_ product: Product) -> Bool
    func getAllBookmarks() -> [Product]
    func getBookmarkCount() -> Int
}