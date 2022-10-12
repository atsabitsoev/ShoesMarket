//
//  CatalogAddButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct CatalogAddButton: View {
    @Binding private(set) var plusColor: Color
    @Binding private(set) var backgroundColor: Color


    var action: () -> Void


    init(
        plusColor: Binding<Color> = .constant(Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)),
        backgroundColor: Binding<Color> = .constant(Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)),
        action: @escaping () -> Void
    ) {
        self._plusColor = plusColor
        self._backgroundColor = backgroundColor
        self.action = action
    }


    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .cornerRadius(42, corners: [.topLeft, .bottomRight])
                    .foregroundColor(backgroundColor)
                Image(systemName: "plus")
                    .resizable()
                    .padding(28)
                    .foregroundColor(plusColor)
                    .bold()
            }
        }
    }
}

struct CatalogAddButton_Previews: PreviewProvider {
    static var previews: some View {
        CatalogAddButton(action: {
            print("hello")
        })
        .frame(width: 80, height: 80)
    }
}
