//
//  ShimmerModifier.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var isAnimating = false
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(
                    colors: [
                        Color.clear,
                        Color.white.opacity(0.6),
                        Color.clear
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .rotationEffect(.degrees(30))
                .offset(x: isAnimating ? 200 : -200)
                .animation(
                    Animation.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: false),
                    value: isAnimating
                )
            )
            .onAppear {
                isAnimating = true
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View {
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}
