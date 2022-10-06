//
//  ShoeDetailsTitlePriceView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsTitlePriceView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("NIKE AIR")
                    .multilineTextAlignment(TextAlignment.leading)
                    .bold()
                Spacer()
            }
            HStack {
                Text("AIR JORDAN 1 MID SE")
                    .multilineTextAlignment(TextAlignment.leading)
                    .font(Font.title2)
                    .bold()
                Spacer()
                Text("$899")
                    .multilineTextAlignment(TextAlignment.leading)
                    .font(Font.title2)
                    .bold()
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
