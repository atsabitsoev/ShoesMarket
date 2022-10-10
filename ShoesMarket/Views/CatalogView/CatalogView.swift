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


    var body: some View {
        NavigationStack {
            ZStack {
                CatalogBackground($detailColor)
                    .ignoresSafeArea()
                VStack {
                    CatalogNavigationView()
                    Spacer()
                    CatalogCategoriesView(
                        selectionColor: $backgroundColor,
                        secondaryColor: $secondaryColor
                    )
                    Spacer()
                    CatalogScrollView(items: $products) { newIndex in
                        if let currentProductVariant = products[newIndex].variants.first {
                            withAnimation {
                                mainColor = currentProductVariant.mainColor
                                backgroundColor = currentProductVariant.backgroundColor
                                detailColor = currentProductVariant.detailColor
                                secondaryColor = currentProductVariant.secondaryColor
                            }
                        }
                    } onItemTap: { index in
                        tappedProduct = products[index]
                        isPresentedDetails = true
                    }

                    Spacer()
                    SMTabBar(
                        tintColor: $mainColor,
                        backgroundColor: $backgroundColor
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
            if let firstProductVariant = products.first?.variants.first {
                withAnimation {
                    mainColor = firstProductVariant.mainColor
                    backgroundColor = firstProductVariant.backgroundColor
                    detailColor = firstProductVariant.detailColor
                    secondaryColor = firstProductVariant.secondaryColor
                }
            }
        }
    }
}


struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
