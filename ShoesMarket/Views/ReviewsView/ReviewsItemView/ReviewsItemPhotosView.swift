//
//  ReviewsItemPhotosView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 15.10.2022.
//

import SwiftUI

struct ReviewsItemPhotosView: View {
    @State private var imagesViewerIsPresented: Bool = false

    private let images: [UIImage]


    init(images: [UIImage]) {
        self.images = images
    }


    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(images.indices, id: \.self) { index in
                    Image(uiImage: images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: Constants.itemSize, height: Constants.itemSize)
                        .cornerRadius(8)
                        .clipped()
                        .onTapGesture {
                            imagesViewerIsPresented = true
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .introspectScrollView { scrollView in
            scrollView.alwaysBounceHorizontal = false
        }
        .sheet(isPresented: $imagesViewerIsPresented) {
            SMImagesViewer(images: images)
        }
    }
}


extension ReviewsItemPhotosView {
    enum Constants {
        static let itemSize: CGFloat = 48
    }
}


struct ReviewsItemPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsItemPhotosView(images: [
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!,
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!,
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!,
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!,
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!,
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!,
            UIImage(named: "runningPhoto")!,
            UIImage(named: "shoesPhoto")!
        ])
    }
}
