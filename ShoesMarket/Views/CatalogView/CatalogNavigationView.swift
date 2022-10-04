//
//  CatalogNavigationView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogNavigationView: View {
    private let cartAction: () -> Void
    private let filtersAction: () -> Void
    private let firmAction: () -> Void


    init(
        cartAction: @escaping () -> Void = {},
        filtersAction: @escaping () -> Void = {},
        firmAction: @escaping () -> Void = {}
    ) {
        self.cartAction = cartAction
        self.filtersAction = filtersAction
        self.firmAction = firmAction
    }


    var body: some View {
        HStack {
            Button {
                firmAction()
            } label: {
                Image("nike")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
            }
            .frame(minWidth: 56, minHeight: 56)
            Spacer()
            Button {
                filtersAction()
            } label: {
                Image("twolines")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
            }
            .frame(width: 56, height: 56)
            Button {
                cartAction()
            } label: {
                Image("cart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
            }
            .frame(width: 56, height: 56)
        }
        .foregroundColor(Color.white)
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

struct CatalogNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogNavigationView()
            .background(Color(white: 0.1))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
