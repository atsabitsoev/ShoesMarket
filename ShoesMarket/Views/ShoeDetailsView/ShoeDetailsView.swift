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

    @State private var isPresentedReviews: Bool = false
    @State private var tappedPhotoIndex: Int = 0
    @State private var showImageViewer: Bool = false


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
                ShoeDetailsNavigationView(
                    tint: Binding(get: {
                        item.variants[selectedVariantIndex].themeColors.detailColor
                    }, set: { _ in })
                )
                .zIndex(2)
                GeometryReader { geo in
                    VStack(spacing: 16) {
                        ZStack {
                            Text(item.title.uppercased())
                                .font(Font.system(size: UIScreen.main.bounds.width / 5))
                                .foregroundColor(Color.white)
                                .bold()
                            ShoeDetailsPhotosView(
                                $selectedPhotoIndex,
                                images: Binding(
                                    get: {
                                        return getAllPhotos()
                                    },
                                    set: { _, _ in })
                            ) { index in
                                tappedPhotoIndex = index
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    showImageViewer = true
                                }
                            }
                        }
                        ShoeDetailsPhotoIndicatorView($selectedPhotoIndex, totalItems: item.variants[selectedVariantIndex].images.count + 1)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                .zIndex(1)
                Spacer()
                    .frame(height: 32)
                ShoeDetailsTitlePriceView(item: $item)
                HStack {
                    ShoeDetailsStarsView()
                        .onTapGesture {
                            isPresentedReviews = true
                        }
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
            }
            .padding(.bottom, 24)
            if showImageViewer {
                SMImagesViewer(
                    isPresented: $showImageViewer,
                    images: getAllPhotos(),
                    startSelectedIndex: tappedPhotoIndex,
                    tint: item.variants[selectedVariantIndex].themeColors.detailColor
                )
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
        .navigationDestination(isPresented: $isPresentedReviews) {
            ReviewsView(
                productId: item.id,
                tintColor: item.variants[selectedVariantIndex].themeColors.detailColor,
                backgroundColor: item.variants[selectedVariantIndex].themeColors.mainColor
            )
            .navigationBarBackButtonHidden()
        }
    }
}


private extension ShoeDetailsView {
    func getAllPhotos() -> [UIImage] {
        [item.variants[selectedVariantIndex].mainImage] + item.variants[selectedVariantIndex].images
    }
}


struct ShoeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsView()
//            .previewDevice(PreviewDevice.init(stringLiteral: "iPhone SE (3rd generation)"))
    }
}
