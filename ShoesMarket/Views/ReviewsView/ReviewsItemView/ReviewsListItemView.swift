//
//  ReviewListItemView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsListItemView: View {

    private var item: Review


    init(item: Review = Review.mock) {
        self.item = item
    }


    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.white)
            VStack(alignment: .leading) {
                Text(item.authorName)
                    .bold()
                ReviewsItemStarsView(raiting: item.raiting)
                Spacer()
                    .frame(height: 16)
                Text(item.text)
            }
            .padding()
        }
    }
}

struct ReviewListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsListItemView()
    }
}
