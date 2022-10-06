//
//  CatalogView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogView: View {
    @State private var isPresentedDetails: Bool = false


    var body: some View {
        NavigationStack {
            ZStack {
                Color.init(white: 0.1)
                    .ignoresSafeArea()
                VStack {
                    CatalogNavigationView()
                    Spacer()
                    CatalogCategoriesView()
                    Spacer()
                    CatalogScrollView { index in
                        print(index)
                        isPresentedDetails = true
                    }
                    Spacer()
                    SMTabBar()
                }
            }
            .navigationDestination(isPresented: $isPresentedDetails) {
                ShoeDetailsView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
