//
//  Product.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 09.10.2022.
//

import UIKit.UIImage
import SwiftUI
import ColorKit


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
            sizes: [String],
            shoeColor: Color
        ) {
            self.mainImage = mainImage
            self.images = images
            self.sizes = sizes
            self.shoeColor = shoeColor

            let dominantColors = try! mainImage.dominantColors(with: .best, algorithm: .kMeansClustering)
            let mainColor = dominantColors[0]
            self.themeColors = ThemeColors(
                mainColor: Color(mainColor),
                detailColor: Color(mainColor.complementaryColor),
                secondaryColor: Color(dominantColors[2]),
                backgroundColor: Color(dominantColors[3]),
                averageColor: Color(try! mainImage.averageColor())
            )
        }


        let mainImage: UIImage
        let images: [UIImage]
        let sizes: [String]
        let themeColors: ThemeColors
        let shoeColor: Color


        struct ThemeColors {
            let mainColor: Color
            let detailColor: Color
            let secondaryColor: Color
            let backgroundColor: Color
            let averageColor: Color
        }
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
                sizes: ["41", "42", "43.5", "45"],
                shoeColor: .red
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
                        sizes: ["41", "43.5", "45"],
                        shoeColor: .yellow
                    )
                ]
            ),
            Product(
                id: "4",
                title: "Nike air",
                subtitle: "air force 1 low",
                cost: 2599,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "greenShoe")!,
                        images: ["runningPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5", "44", "45"],
                        shoeColor: .green
                    ),
                    Variant(
                        mainImage: UIImage(named: "redShoe")!,
                        images: ["shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5", "45"],
                        shoeColor: .red
                    )
                ]
            ),
            Product(
                id: "2",
                title: "Nike air",
                subtitle: "air jordan 1 retro high",
                cost: 1399,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "redShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "44", "45"],
                        shoeColor: .red
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
                        sizes: ["41", "42", "43.5"],
                        shoeColor: .blue
                    )
                ]
            )
        ]
    }
}
