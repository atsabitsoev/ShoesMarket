//
//  ShoeDetailsBuyButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsBuyButton: View {
    @Binding private var textColor: Color
    @Binding private var tintColor: Color

    
    private let action: () -> Void


    init(
        textColor: Binding<Color> = .constant(Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)),
        tintColor: Binding<Color> = .constant(Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)),
        _ action: @escaping () -> Void
    ) {
        self._textColor = textColor
        self._tintColor = tintColor
        self.action = action
    }


    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 150, height: 64)
                    .foregroundColor(tintColor)
                Text("В КОРЗИНУ")
                    .bold()
                    .padding(8)
                    .foregroundColor(textColor)
                    .font(Font.title3)
            }
            .padding(.trailing, 24)
        }
    }
}

struct ShoeDetailsBuyButton_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsBuyButton({})
    }
}
