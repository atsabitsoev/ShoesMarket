//
//  CatalogNavigationView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogNavigationView: View {
    @Binding private var filtersActive: Bool
    @Binding private var tintColor: Color

    private let cartAction: () -> Void
    private let filtersAction: () -> Void
    private let firmAction: () -> Void


    init(
        filtersActive: Binding<Bool> = .constant(true),
        tintColor: Binding<Color> = .constant(.blue),
        cartAction: @escaping () -> Void = {},
        filtersAction: @escaping () -> Void = {},
        firmAction: @escaping () -> Void = {}
    ) {
        self._filtersActive = filtersActive
        self._tintColor = tintColor
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
            .frame(minWidth: Constants.itemSize, minHeight: Constants.itemSize)
            Spacer()
            Button {} label: {
                ZStack {
                    Image(systemName: filtersActive ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: Constants.buttonSize)
                    if filtersActive {
                        Circle()
                            .frame(width: 12)
                            .foregroundColor(tintColor)
                            .position(
                                x: (Constants.itemSize - Constants.buttonSize) / 2 + Constants.buttonSize - 2,
                                y: (Constants.itemSize - Constants.buttonSize) / 2 + 2
                            )
                    }
                }
            }
            .frame(width: Constants.itemSize, height: Constants.itemSize)
            .buttonStyle(SMButtonStyle(action: filtersAction))
            Button {} label: {
                Image(systemName: "cart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: Constants.buttonSize)
            }
            .frame(width: Constants.itemSize, height: Constants.itemSize)
            .buttonStyle(SMButtonStyle(action: cartAction))
        }
        .foregroundColor(Color.white)
        .padding(.horizontal, 8)
    }
}


private extension CatalogNavigationView {
    enum Constants {
        static let itemSize: CGFloat = 56
        static let buttonSize: CGFloat = 24
    }
}


struct CatalogNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogNavigationView()
            .background(Color(white: 0.1))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
