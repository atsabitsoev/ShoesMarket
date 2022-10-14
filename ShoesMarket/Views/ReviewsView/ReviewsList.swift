//
//  ReviewsList.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsList: View {
    @Binding private var items: [Review]


    init(items: Binding<[Review]> = .constant([])) {
        self._items = items
    }


    var body: some View {
        List(items) { item in
            ReviewsListItemView(item: item)
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
