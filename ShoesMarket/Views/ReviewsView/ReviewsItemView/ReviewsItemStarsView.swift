//
//  ReviewsItemStarsView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsItemStarsView: View {
    private let tintColor = Color.yellow

    private let totalStars: Int = 5
    private let raiting: Int


    init(raiting: Int = 4) {
        self.raiting = raiting
    }


    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<totalStars, id: \.self) { index in
                Image(systemName: index < raiting ? "star.fill" : "star")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(tintColor)
                    .frame(width: Constants.starSize, height: Constants.starSize)
                    .padding(.horizontal, Constants.spacing)
            }
        }
        .padding(.horizontal, -Constants.spacing)
    }
}


private extension ReviewsItemStarsView {
    enum Constants {
        static let starSize: CGFloat = 20
        static let spacing: CGFloat = 4
    }
}


struct ReviewsItemStarsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsItemStarsView()
            .background(Color.white)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
