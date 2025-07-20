//
//  ShopListBaseView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ShopListBaseView: View {
    let dummyUrl: String = "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"

    var body: some View {
        ScrollView {
            headerView

            LazyVStack(spacing: 10) {
                ForEach(0..<100) { index in
                    ProductCardView(dummyUrl: dummyUrl, index: index)
                }
            }
            .frame(maxWidth: .infinity)
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
