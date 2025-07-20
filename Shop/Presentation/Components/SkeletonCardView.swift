//
//  SkeletonCardView.swift
//  Shop
//
//  Created by Ilyasa' Azmi on 20/07/25.
//

import SwiftUI

struct SkeletonCardView: View {
    var body: some View {
        HStack(spacing: 16) {
            // Image placeholder
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 64, height: 64)
                .shimmer()
            
            VStack(alignment: .leading, spacing: 8) {
                // Title placeholder
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 16)
                    .frame(maxWidth: .infinity)
                    .shimmer()
                
                // Description placeholder (2 lines)
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 12)
                    .frame(maxWidth: .infinity)
                    .shimmer()
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 12)
                    .frame(width: 120)
                    .shimmer()
                
                // Price placeholder
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 14)
                    .frame(width: 80)
                    .shimmer()
            }
            
            VStack {
                // Heart icon placeholder
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 16, height: 16)
                    .shimmer()
                
                Spacer()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}