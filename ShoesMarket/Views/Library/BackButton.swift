//
//  BackButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct BackButton: View {
    @Binding private var tintColor: Color


    private let action: () -> Void


    init(
        tintColor: Binding<Color> = .constant(.blue),
        action: @escaping () -> Void = {}
    ) {
        self._tintColor = tintColor
        self.action = action
    }


    var body: some View {
        Button {} label: {
            Image(systemName: "chevron.left")
                .frame(width: 40, height: 40)
                .background(Color.white)
                .bold()
                .foregroundColor(tintColor)
                .cornerRadius(8)
                .shadow(radius: 10)
        }
        .buttonStyle(SMButtonStyle(action: action))
        .frame(width: 56, height: 56)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
