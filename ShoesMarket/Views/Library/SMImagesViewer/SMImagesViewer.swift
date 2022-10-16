//
//  SMImagesViewer.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 16.10.2022.
//

import SwiftUI
import ImageViewer

struct SMImagesViewer: View {
    private let images: [UIImage]


    init(images: [UIImage] = ["runningPhoto", "shoesPhoto"].map(UIImage.init)) {
        self.images = images
    }


    var body: some View {
        TabView {
            ForEach(images.indices, id: \.self) { index in
                ScrollView([.horizontal]) {
                    ImageViewer(
                        image: .constant(Image(uiImage: images[index])),
                        viewerShown: .constant(true)
                    )
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct SMImagesViewer_Previews: PreviewProvider {
    static var previews: some View {
        SMImagesViewer()
    }
}
