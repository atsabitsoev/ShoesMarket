//
//  ShoeDetailsPhotosView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 06.10.2022.
//

import SwiftUI

struct ShoeDetailsPhotosView: View {
    @Binding private var selectedIndex: Int
    @Binding private var images: [UIImage]


    private let imageTapped: (_ index: Int) -> Void


    init(
        _ selection: Binding<Int>,
        images: Binding<[UIImage]> = .constant([UIImage(named: "nikeShoe")!, UIImage(named: "shoesPhoto")!, UIImage(named: "runningPhoto")!]),
        imageTapped: @escaping (_ index: Int) -> Void = { _ in }
    )
    {
        self._selectedIndex = selection
        self._images = images
        self.imageTapped = imageTapped
    }


    var body: some View {
        GeometryReader { geo in
            TabView(selection: $selectedIndex) {
                ForEach(images.indices, id: \.self) { index in
                    if index == 0 {
                        Image(uiImage: images[index])
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(Angle.degrees(-30))
                            .shadow(
                                color: Color.black.opacity(0.5),
                                radius: 10,
                                x: 10,
                                y: 20
                            )
                            .offset(CGSize(
                                width: -geo.size.width / 12,
                                height: -geo.size.height / 12
                            ))
                            .frame(maxHeight: abs(geo.size.height - 68))
                            .onTapGesture {
                                imageTapped(index)
                            }
                    } else {
                        GeometryReader { geo in
                            Image(uiImage: images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: geo.size.height)
                                .clipped()
                                .cornerRadius(16)
                                .onTapGesture {
                                    imageTapped(index)
                                }
                        }
                        .padding(.top, -16)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 80)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.vertical, -80)
        }
    }
}

struct ShoeDetailsPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
                .frame(height: 100)
            ShoeDetailsPhotosView(.constant(0))
            Spacer()
                .frame(height: 100)
        }
            .previewLayout(.sizeThatFits)
            .previewDevice(PreviewDevice.init(stringLiteral: "iPhone SE (3rd generation)"))
    }
}
