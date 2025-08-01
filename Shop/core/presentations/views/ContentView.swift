//
//  ContentView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            if selectedTab == 0 {
                ProductListBaseView()
            } else if selectedTab == 1 {
                BookmarkView()
            }

            TabBarView(selectedTab: $selectedTab)
        }
    }
}
