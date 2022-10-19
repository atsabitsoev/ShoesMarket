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

    @State private var emptyItemsScenario: Bool = false
    @State private var emptyTextOpacity: CGFloat = 0

    @State private var categories: [Category] = []
    @State private var currentCategory: Category?

    @State private var isPresentedDetails: Bool = false

    @State private var filters: [Tag] = [.init(id: "1", name: "")]

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
                    CatalogNavigationView(
                        filtersActive: Binding(get: {
                            !filters.isEmpty
                        }, set: { (_, _) in }),
                        tintColor: $detailColor,
                        cartAction: {
                            print("cart")
                        },
                        filtersAction: {
                            print("filters")
                        },
                        firmAction: {
                            print("firm")
                        }
                    )

                    Spacer()
                    CatalogCategoriesView(
                        categories: $categories,
                        selectionColor: $detailColor,
                        secondaryColor: $secondaryColor) { category in
                            currentCategory = category
                            updateShownProducts()
                        }
                    Spacer()
                    ZStack {
                        CatalogScrollView(items: $shownProducts) { newIndex in
                            print(newIndex)
                            if newIndex == -1 {
                                emptyItemsScenario = true
                                return
                            } else {
                                emptyItemsScenario = false
                            }
                            currentProductIndex = newIndex
                            updateColors()
                        } onItemTap: { index in
                            tappedProduct = shownProducts[index]
                            isPresentedDetails = true
                        }
                        if emptyItemsScenario {
                            VStack {
                                Spacer()
                                Text("Тут ничего нет :(")
                                    .bold()
                                    .foregroundColor(.black.opacity(0.5))
                                    .scaledToFit()
                                    .opacity(emptyTextOpacity)
                                    .animation(Animation.linear(duration: 0.3), value: emptyTextOpacity)
                                    .onAppear {
                                        emptyTextOpacity = 1
                                    }
                                    .onDisappear {
                                        emptyTextOpacity = 0
                                    }
                                LottieView(lottieFile: "emptyShoeAnimation")
                                    .frame(height: 150)
                                Spacer()
                            }
                        }
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
        let newShownProducts: [Product]
        if let currentCategory {
            newShownProducts = allProducts
                .filter({
                    $0.categories.contains(currentCategory.id) || currentCategory.isAllProductsCategory
                })
        } else {
            newShownProducts = allProducts
        }
        let filteredNewShownProducts = newShownProducts
            .filter({ product in
                filters.reduce(true, { result, filter in
                    result && product.tags.contains(where: { tag in
                        filter.id == tag.id
                    })
                })
            })
        withAnimation(.easeInOut(duration: 0.3)) {
            shownProducts = filteredNewShownProducts
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
