//
//  ShoeDetailsView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct ShoeDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragOffset = CGSize.zero

    @State private var selectedPhotoIndex: Int = 0
    @State private var selectedVariantIndex: Int = 0
    @Binding private var item: Product


    init(item: Binding<Product> = .constant(.mock)) {
        self._item = item
    }


    var body: some View {
        ZStack {
            (item.variants[selectedVariantIndex].themeColors.mainColor)
                .ignoresSafeArea()
            Circle()
                .foregroundColor(item.variants[selectedVariantIndex].themeColors.averageColor)
                .frame(width: UIScreen.main.bounds.width * 1.2)
                .position(x: UIScreen.main.bounds.width / 9 * 8, y: 80)
            VStack {
                ShoeDetailsNavigationView()
                GeometryReader { geo in
                    VStack(spacing: 16) {
                        ZStack {
                            Text(item.title.uppercased())
                                .font(Font.system(size: UIScreen.main.bounds.width / 5))
                                .foregroundColor(Color.white)
                                .bold()
                            ShoeDetailsPhotosView(
                                $selectedPhotoIndex,
                                images: Binding(get: {
                                    return [item.variants[selectedVariantIndex].mainImage] + item.variants[selectedVariantIndex].images
                                }, set: { _, _ in })
                            )
                        }
                        ShoeDetailsPhotoIndicatorView($selectedPhotoIndex, totalItems: item.variants[selectedVariantIndex].images.count + 1)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                Spacer()
                    .frame(height: 32)
                ShoeDetailsTitlePriceView(item: $item)
                HStack {
                    ShoeDetailsStarsView()
                    Spacer()
                }
                Spacer()
                    .frame(height: 32)
                HStack {
                    ShoeDetailsSizeView(
                        sizes: Binding(get: {
                            item.variants[selectedVariantIndex].sizes
                        }, set: { _, _ in }),
                        textColor: Binding(get: {
                            item.variants[selectedVariantIndex].themeColors.secondaryColor
                        }, set: { _, _ in }),
                        tintColor: Binding(get: {
                            item.variants[selectedVariantIndex].themeColors.detailColor
                        }, set: { _, _ in }),
                        backgroundColor: item.variants[selectedVariantIndex].themeColors.secondaryColor
                    )
                    Spacer()
                }
                Spacer()
                    .frame(height: 32)
                HStack(alignment: .bottom) {
                    ShoeDetailsColorsView(
                        colors: item.variants.map(\.shoeColor),
                        selectedIndex: $selectedVariantIndex
                    )
                    Spacer()
                    ShoeDetailsBuyButton(
                        textColor: Binding(get: {
                            item.variants[selectedVariantIndex].themeColors.secondaryColor
                        }, set: { _, _ in }),
                        tintColor: Binding(get: {
                            item.variants[selectedVariantIndex].themeColors.detailColor
                        }, set: { _, _ in })) {
                            print("Buy!")
                        }
                }
                Spacer()
                    .frame(height: 32)
            }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .updating(
                    $dragOffset,
                    body: { (value, state, transaction) in
                        if value.startLocation.x < 20 {
                            dismiss()
                        }
                    }
                )
        )
    }
}

struct ShoeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsView()
    }
}
