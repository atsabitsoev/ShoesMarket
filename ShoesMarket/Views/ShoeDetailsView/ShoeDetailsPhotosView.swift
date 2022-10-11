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


    init(
        _ selection: Binding<Int>,
        images: Binding<[UIImage]> = .constant([UIImage(named: "nikeShoe")!, UIImage(named: "shoesPhoto")!, UIImage(named: "runningPhoto")!]))
    {
        self._selectedIndex = selection
        self._images = images
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
                                width: -24,
                                height: -24
                            ))
                            .frame(maxHeight: abs(geo.size.height - 96))
                    } else {
                        GeometryReader { geo in
                            Image(uiImage: images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: geo.size.height)
                                .clipped()
                                .cornerRadius(16)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(36)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(-36)
        }
    }
}

struct ShoeDetailsPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsPhotosView(.constant(0))
            .previewLayout(.sizeThatFits)
    }
}
