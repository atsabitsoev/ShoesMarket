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
    let categories: [String]
    let tags: [Tag]

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
        ],
        categories: ["1"],
        tags: [.init(id: "1", name: "Зимние"), .init(id: "2", name: "Высокие")]
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
                ],
                categories: ["1"],
                tags: [.init(id: "1", name: "Зимние"), .init(id: "2", name: "Высокие"), .init(id: "4", name: "Джорданы")]
            ),
            Product(
                id: "123",
                title: "Nike air",
                subtitle: "air max 90 mid winter",
                cost: 6799,
                raiting: 4.9,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "blackShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["44", "45"],
                        shoeColor: .black
                    )
                ],
                categories: ["1"],
                tags: [.init(id: "3", name: "Черно-белые")]
            ),
            Product(
                id: "13",
                title: "Nike air",
                subtitle: "air jordan 1 mid se",
                cost: 1899,
                raiting: 5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "redShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "43", "45"],
                        shoeColor: .red
                    )
                ],
                categories: ["1", "3"],
                tags: [.init(id: "4", name: "Джорданы")]
            ),
            Product(
                id: "3.2",
                title: "Nike dunk",
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
                ],
                categories: ["2"],
                tags: [.init(id: "1", name: "Зимние"), .init(id: "5", name: "Данки")]
            ),
            Product(
                id: "5",
                title: "Nike air",
                subtitle: "dunk low",
                cost: 5479,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "grayShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["42", "43", "44"],
                        shoeColor: .gray
                    )
                ],
                categories: ["4"],
                tags: [.init(id: "3", name: "Черно-белые")]
            ),
            Product(
                id: "2",
                title: "Nike air",
                subtitle: "air jordan 1 retro high",
                cost: 1399,
                raiting: 3.5,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "blueShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5"],
                        shoeColor: .blue
                    ),
                    Variant(
                        mainImage: UIImage(named: "redShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "44", "45"],
                        shoeColor: .red
                    )
                ],
                categories: ["2"],
                tags: [.init(id: "4", name: "Джорданы")]
            ),
            Product(
                id: "6",
                title: "Nike court",
                subtitle: "court vision low",
                cost: 2799,
                raiting: 3,
                variants: [
                    Variant(
                        mainImage: UIImage(named: "whiteShoe")!,
                        images: ["runningPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5", "44", "45"],
                        shoeColor: .white
                    ),
                    Variant(
                        mainImage: UIImage(named: "grayShoe")!,
                        images: ["shoesPhoto"].map(UIImage.init),
                        sizes: ["41", "42", "43.5", "45"],
                        shoeColor: .gray
                    ),
                    Variant(
                        mainImage: UIImage(named: "blackShoe")!,
                        images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                        sizes: ["44", "45"],
                        shoeColor: .black
                    )
                ],
                categories: ["1", "3"],
                tags: [.init(id: "3", name: "Черно-белые")]
            )
        ]
    }
}


extension Product: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
