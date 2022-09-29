//
//  CatalogView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogView: View {
    var body: some View {
        ZStack {
            Color.init(white: 0.1)
                .ignoresSafeArea()
            VStack {
                Spacer()
                SMTabBar()
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
