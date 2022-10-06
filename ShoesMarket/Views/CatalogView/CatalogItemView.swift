//
//  CatalogItemView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogItemView: View {
    @State private var textColor = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .foregroundColor(Color.white)
            VStack(spacing: Constants.spacing) {
                HStack {
                    Text("NIKE AIR")
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
                    Spacer()
                }
                HStack {
                    Text("AIR JORDAN 1 MID SE")
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
                    Spacer()
                }
                HStack {
                    Text("$899")
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
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
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CatalogAddButton {
                        print("hello")
                    }
                    .frame(width: 80, height: 80)
                }
            }
            Image("nikeShoe")
                .resizable()
                .scaledToFit()
                .rotationEffect(Constants.shoeRotation)
                .frame(width: Constants.width)
                .padding(.top, 40)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 20)
        }
        .frame(width: Constants.width, height: Constants.height)
    }
}


extension CatalogItemView {
    enum Constants {
        static let width: CGFloat = 250
        static let height: CGFloat = 380
        
        fileprivate static let spacing: CGFloat = 6
        fileprivate static let padding: EdgeInsets = EdgeInsets(top: 44, leading: 24, bottom: 24, trailing: 24)
        fileprivate static let cornerRadius: CGFloat = 44
        fileprivate static let shoeRotation: Angle = Angle.degrees(-30)
    }
}


struct CatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemView()
            .background(Color.init(white: 0.1))
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
