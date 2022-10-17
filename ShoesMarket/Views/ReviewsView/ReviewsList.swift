//
//  ReviewsList.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsList: View {
    @Binding private var items: [Review]

    private let imageTapped: (_ itemIndex: Int, _ imageIndex: Int) -> Void


    init(
        items: Binding<[Review]> = .constant([]),
        imageTapped: @escaping(_ itemIndex: Int, _ imageIndex: Int) -> Void = { (_, _) in }
    ) {
        self._items = items
        self.imageTapped = imageTapped
    }


    var body: some View {
        List(items.indices, id: \.self) { itemIndex in
            ReviewsListItemView(
                item: items[itemIndex],
                imageTapped: { imageIndex in
                    imageTapped(itemIndex, imageIndex)
                }
            )
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(Visibility.hidden)
    }
}

struct ReviewsList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsList()
    }
}
