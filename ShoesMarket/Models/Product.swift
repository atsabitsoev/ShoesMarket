//
//  Product.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 09.10.2022.
//

import UIKit.UIImage
import SwiftUI


struct Product {
    let id: String
    let title: String
    let subtitle: String
    let cost: Int
    let raiting: CGFloat
    let variants: [Variant]

    var costLabel: String {
        "\(cost)₽"
    }


    struct Variant {
        init(
            mainImage: UIImage,
            images: [UIImage],
            sizes: [String]
        ) {
            self.mainImage = mainImage
            self.images = images
            self.sizes = sizes
            guard let colors: UIImageColors = mainImage.getColors(quality: UIImageColorsQuality.highest) else {
                self.mainColor = .blue
                self.backgroundColor = .black
                self.detailColor = .gray
                self.secondaryColor = .brown
                return
            }
            self.mainColor = Color(colors.primary)
            self.backgroundColor = Color(colors.background)
            self.detailColor = Color(colors.detail)
            self.secondaryColor = Color(colors.secondary)
        }


        let mainImage: UIImage
        let images: [UIImage]
        let sizes: [String]
        let mainColor: Color
        let detailColor: Color
        let secondaryColor: Color
        let backgroundColor: Color
    }


    static var all: [Product] {
        get async {
            await getAll()
        }
    }


    static let mock = Product(
        id: "2",
        title: "Nike air",
        subtitle: "air jordan 1 retro high",
        cost: 1099,
        raiting: 3.5,
        variants: [
            Variant(
                mainImage: UIImage(named: "redShoe")!,
                images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                sizes: ["41", "42", "43.5", "45"]
            )
        ]
    )
}


private extension Product {
    static func getAll() async -> [Product] {
        return [
            Product(
                id: "1",
                title: "Nike air",
                subtitle: "air jordan 1 mid se",
                cost: 899,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "nikeShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "43.5", "45"]
                    )
                ]
            ),
            Product(
                id: "4",
                title: "Nike air",
                subtitle: "air force 1 low",
                cost: 1099,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "greenShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5", "44", "45"]
                    )
                ]
            ),
            Product(
                id: "2",
                title: "Nike air",
                subtitle: "air jordan 1 retro high",
                cost: 1099,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "redShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "44", "45"]
                    )
                ]
            ),
            Product(
                id: "3",
                title: "Nike air",
                subtitle: "air jordan 1 high university",
                cost: 1099,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "blueShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5"]
                    )
                ]
            )
        ]
    }
}
