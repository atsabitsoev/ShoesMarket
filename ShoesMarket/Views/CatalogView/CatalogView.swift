//
//  CatalogView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogView: View {
    @State private var tappedProduct: Product = Product.mock
    @State private var products: [Product] = []
    @State private var isPresentedDetails: Bool = false

    @State private var mainColor = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)
    @State private var backgroundColor = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)
    @State private var secondaryColor = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)
    @State private var detailColor = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)
    @State private var averageColor: Color = .cyan


    var body: some View {
        NavigationStack {
            ZStack {
                CatalogBackground($mainColor)
                    .ignoresSafeArea()
                VStack {
                    CatalogNavigationView()
                    Spacer()
                    CatalogCategoriesView(
                        selectionColor: $detailColor,
                        secondaryColor: $secondaryColor
                    )
                    Spacer()
                    CatalogScrollView(items: $products) { newIndex in
                        let currentProductVariant = products[newIndex].variants[0]
                        withAnimation {
                            mainColor = currentProductVariant.themeColors.mainColor
                            backgroundColor = currentProductVariant.themeColors.backgroundColor
                            detailColor = currentProductVariant.themeColors.detailColor
                            secondaryColor = currentProductVariant.themeColors.secondaryColor
                            averageColor = currentProductVariant.themeColors.averageColor
                        }
                    } onItemTap: { index in
                        tappedProduct = products[index]
                        isPresentedDetails = true
                    }

                    Spacer()
                    SMTabBar(
                        tintColor: $detailColor,
                        backgroundColor: $secondaryColor
                    )
                }
            }
            .navigationDestination(isPresented: $isPresentedDetails) {
                ShoeDetailsView(item: $tappedProduct)
                .navigationBarBackButtonHidden()
            }
        }
        .task {
            products = await Product.all
            guard !products.isEmpty else { return }
            let firstProductVariant = products[0].variants[0]
            withAnimation {
                mainColor = firstProductVariant.themeColors.mainColor
                backgroundColor = firstProductVariant.themeColors.backgroundColor
                detailColor = firstProductVariant.themeColors.detailColor
                secondaryColor = firstProductVariant.themeColors.secondaryColor
                averageColor = firstProductVariant.themeColors.averageColor
            }
        }
    }
}


struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
