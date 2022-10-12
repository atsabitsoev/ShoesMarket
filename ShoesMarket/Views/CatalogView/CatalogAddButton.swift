//
//  CatalogAddButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct SMButtonStyle: ButtonStyle {
    @State private var touchDown: Bool = false

    private let action: () -> Void
    private let animateHighlight: Bool


    init(
        action: @escaping () -> Void,
        animateHighlight: Bool = true
    ) {
        self.action = action
        self.animateHighlight = animateHighlight
    }


    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            ._onButtonGesture { val in
                touchDown = val
            } perform: {
                action()
            }
            .opacity(touchDown ? 0.5 : 1)
            .animation(touchDown || !animateHighlight ? nil : .linear, value: touchDown)
    }
}


struct CatalogAddButton: View {
    @Binding private var plusColor: Color
    @Binding private var backgroundColor: Color


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
        Button(action: {}) {
            ZStack {
                Rectangle()
                    .cornerRadius(44, corners: [.topLeft, .bottomRight])
                    .foregroundColor(backgroundColor)
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(plusColor)
                    .bold()
            }
        }
        .buttonStyle(SMButtonStyle(action: action))

    }
}

struct CatalogAddButton_Previews: PreviewProvider {
    static var previews: some View {
        CatalogAddButton(action: {})
        .frame(width: 80, height: 80)
    }
}
