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
    @Binding private var item: Product


    init(item: Binding<Product> = .constant(.mock)) {
        self._item = item
    }


    var body: some View {
        ZStack {
            (item.variants.first?.detailColor ?? .black)
                .ignoresSafeArea()
            Circle()
                .foregroundColor(item.variants.first?.mainColor ?? .black)
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
                            ShoeDetailsPhotosView($selectedPhotoIndex, images: [item.variants[0].mainImage] + item.variants[0].images)
                        }
                        ShoeDetailsPhotoIndicatorView($selectedPhotoIndex, totalItems: item.variants[0].images.count + 1)
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
                        sizes: item.variants[0].sizes,
                        textColor: item.variants[0].mainColor,
                        tintColor: item.variants[0].backgroundColor,
                        backgroundColor: item.variants[0].mainColor
                    )
                    Spacer()
                }
                Spacer()
                    .frame(height: 32)
                HStack(alignment: .bottom) {
                    ShoeDetailsColorsView()
                    Spacer()
                    ShoeDetailsBuyButton(
                        textColor: item.variants[0].backgroundColor,
                        tintColor: item.variants[0].mainColor) {
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
