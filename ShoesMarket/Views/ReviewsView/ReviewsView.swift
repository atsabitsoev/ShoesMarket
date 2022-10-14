//
//  ReviewsView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsView: View {
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragOffset = CGSize.zero
    @State private var reviews: [Review] = []


    private let productId: String
    private let tintColor: Color
    private let backgroundColor: Color


    init(
        productId: String = "1",
        tintColor: Color = .blue,
        backgroundColor: Color = .yellow
    ) {
        self.productId = productId
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
    }


    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack(spacing: 8) {
                ReviewsNavigationView(tint: .constant(tintColor))
                ReviewsList(items: $reviews)
            }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .updating(
                    $dragOffset,
                    body: { (value, state, transaction) in
                        if value.startLocation.x < 20 {
                            dismiss()
                        }
                    }
                )
        )
        .task {
            reviews = await Review.getReviews(by: productId)
        }
    }
}

struct ReviewsListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
