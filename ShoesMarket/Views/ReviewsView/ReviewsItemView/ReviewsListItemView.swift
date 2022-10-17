//
//  ReviewListItemView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsListItemView: View {

    private let item: Review
    private let imageTapped: (_ index: Int) -> Void
    
    
    init(
        item: Review = Review.mock,
        imageTapped: @escaping (_ index: Int) -> Void = { _ in }
    ) {
        self.item = item
        self.imageTapped = imageTapped
    }
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.white)
            VStack(alignment: .leading, spacing: 0) {
                Text(item.authorName)
                    .bold()
                    .padding(.horizontal, 16)
                Spacer()
                    .frame(height: 8)
                ReviewsItemStarsView(raiting: item.raiting)
                    .padding(.horizontal, 16)
                Spacer()
                    .frame(height: 16)
                ReviewsItemPhotosView(images: item.photos, imageTapped: { index in
                    imageTapped(index)
                })
                .frame(height: ReviewsItemPhotosView.Constants.itemSize)
                Spacer()
                    .frame(height: 16)
                Text(item.text)
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
        }
    }
}

struct ReviewListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsListItemView()
            .previewLayout(.sizeThatFits)
    }
}
