//
//  ProductCardView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ProductCardView: View {
    let dummyUrl: String
    let index: Int

    @State private var isBookmarked: Bool = false

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: dummyUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 64)
            } placeholder: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 64, height: 64)
            }

            VStack(alignment: .leading) {
                Text("Product Name \(index)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Product Price \(index)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VStack {
                Image(systemName: isBookmarked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.purple)
                    .onTapGesture {
                        isBookmarked.toggle()
                    }

                Spacer()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.purple, lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}
