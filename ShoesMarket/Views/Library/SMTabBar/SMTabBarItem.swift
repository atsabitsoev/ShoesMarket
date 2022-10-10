//
//  SMTabBarButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 29.09.2022.
//

import SwiftUI

struct SMTabBarItem: View {
    private let iconName: String
    

    @Binding var isSelected: Bool
    @Binding private var selectedColor: Color
    @Binding private var unSelectedColor: Color


    init(
        iconName: String,
        isSelected: Binding<Bool> = .constant(false),
        selectedColor: Binding<Color>,
        unSelectedColor: Binding<Color>
    ) {
        self.iconName = iconName

        self._isSelected = isSelected
        self._selectedColor = selectedColor
        self._unSelectedColor = unSelectedColor
    }

    var body: some View {
        ZStack {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .foregroundColor(isSelected ? selectedColor : unSelectedColor)
                .frame(width: Constants.iconSize, height: Constants.iconSize)
                .animation(.easeInOut.speed(3), value: isSelected)
        }
    }
}


extension SMTabBarItem {
    enum Constants {
        fileprivate static let iconSize: CGFloat = 24
    }
}


struct SMTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        SMTabBarItem(
            iconName: "home",
            selectedColor: .constant(Color.yellow),
            unSelectedColor: .constant(Color(white: 0.15))
        )
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
