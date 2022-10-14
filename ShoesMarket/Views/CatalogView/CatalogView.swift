//
//  CatalogView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogView: View {
    @State private var tappedProduct: Product = Product.mock
    @State private var allProducts: [Product] = []
    @State private var shownProducts: [Product] = []
    @State private var currentProductIndex: Int = 0
    @State private var categories: [Category] = []
    @State private var currentCategory: Category?
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
                        categories: $categories,
                        selectionColor: $detailColor,
                        secondaryColor: $secondaryColor) { category in
                            currentCategory = category
                            updateShownProducts()
                        }
                    Spacer()
                    CatalogScrollView(items: $shownProducts) { newIndex in
                        currentProductIndex = newIndex
                        updateColors()
                    } onItemTap: { index in
                        tappedProduct = shownProducts[index]
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
            await loadProducts()
        }
        .task {
            await loadCategories()
        }
    }
}


private extension CatalogView {
    func loadProducts() async {
        allProducts = await Product.all
        updateShownProducts()
    }

    func loadCategories() async {
        let loadedCategories = await Category.all
        categories = [Category.allProductsCategory] + loadedCategories
        currentCategory = categories.first
        updateShownProducts()
    }

    func updateShownProducts() {
        withAnimation {
            if let currentCategory {
                shownProducts = allProducts.filter({ return $0.categories.contains(currentCategory.id) || currentCategory.isAllProductsCategory })
            } else {
                shownProducts = allProducts
            }
        }
    }

    func updateColors() {
        let firstProductVariant = shownProducts[currentProductIndex].variants[0]
        withAnimation {
            mainColor = firstProductVariant.themeColors.mainColor
            backgroundColor = firstProductVariant.themeColors.backgroundColor
            detailColor = firstProductVariant.themeColors.detailColor
            secondaryColor = firstProductVariant.themeColors.secondaryColor
            averageColor = firstProductVariant.themeColors.averageColor
        }
    }
}


struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
