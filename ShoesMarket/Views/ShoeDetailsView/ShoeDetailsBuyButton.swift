//
//  ShoeDetailsBuyButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsBuyButton: View {
    @State private(set) var textColor: Color = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)
    @State private(set) var tintColor: Color = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)

    
    private let action: () -> Void


    init(_ action: @escaping () -> Void) {
        self.action = action
    }


    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 64)
                    .foregroundColor(tintColor)
                Text("BUY")
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