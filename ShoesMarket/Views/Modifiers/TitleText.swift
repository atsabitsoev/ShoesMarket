//
//  TitleText.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI


extension Text {
    func title() -> some View {
        self
            .font(Font.title2)
            .bold()
            .foregroundColor(Color.white)
            .shadow(radius: 10, y: 2)
    }
}
