//
//  CatalogBackground.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 10.10.2022.
//

import SwiftUI

struct CatalogBackground: View {
    @Binding var color: Color


    init(_ color: Binding<Color> = .constant(Color.red)) {
        self._color = color
    }


    var body: some View {
        Rectangle()
            .foregroundColor(color)
    }
}

struct CatalogBackground_Previews: PreviewProvider {
    static var previews: some View {
        CatalogBackground()
    }
}
