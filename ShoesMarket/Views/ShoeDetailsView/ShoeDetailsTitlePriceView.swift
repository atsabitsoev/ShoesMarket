//
//  ShoeDetailsTitlePriceView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsTitlePriceView: View {
    @Binding private var item: Product


    init(item: Binding<Product> = .constant(.mock)) {
        self._item = item
    }


    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(item.title.uppercased())
                    .multilineTextAlignment(TextAlignment.leading)
                    .bold()
                    .shadow(radius: 10)
                Spacer()
            }
            HStack {
                Text(item.subtitle.uppercased())
                    .multilineTextAlignment(TextAlignment.leading)
                    .font(Font.title2)
                    .bold()
                    .shadow(radius: 10)
                Spacer()
                Text(item.costLabel)
                    .multilineTextAlignment(TextAlignment.leading)
                    .font(Font.title2)
                    .bold()
                    .shadow(radius: 10)
            }
        }
        .foregroundColor(Color.white)
        .padding(.horizontal, 24)
    }
}

struct ShoeDetailsTitlePriceView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsTitlePriceView()
            .background(Color.black)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
