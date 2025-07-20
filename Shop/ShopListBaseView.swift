//
//  ShopListBaseView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ShopListBaseView: View {
    var body: some View {
        ScrollView {
            headerView

            VStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
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
