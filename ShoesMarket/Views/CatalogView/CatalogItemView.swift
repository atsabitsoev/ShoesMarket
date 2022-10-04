//
//  CatalogItemView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogItemView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .foregroundColor(Color.white)
            VStack(spacing: Constants.spacing) {
                HStack {
                    Text("NIKE AIR")
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("AIR JORDAN 1 MID SE")
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("$899")
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("NIKE\nAIR")
                        .multilineTextAlignment(TextAlignment.leading)
                        .font(Font(CTFont(.label, size: 72)))
                        .foregroundColor(Color(white: 0.9))
                        .bold()
                    Spacer()
                }
                Spacer()
            }
            .padding(Constants.padding)
            Image("nikeShoe")
                .resizable()
                .scaledToFit()
                .rotationEffect(Constants.shoeRotation)
                .frame(width: Constants.width)
        }
        .frame(width: Constants.width, height: Constants.height)
    }
}


extension CatalogItemView {
    enum Constants {
        static let width: CGFloat = 250
        static let height: CGFloat = 400
        
        fileprivate static let spacing: CGFloat = 6
        fileprivate static let padding: EdgeInsets = EdgeInsets(top: 44, leading: 24, bottom: 24, trailing: 24)
        fileprivate static let cornerRadius: CGFloat = 44
        fileprivate static let shoeRotation: Angle = Angle.degrees(-30)
    }
}


private struct CatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemView()
            .background(Color.init(white: 0.1))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
