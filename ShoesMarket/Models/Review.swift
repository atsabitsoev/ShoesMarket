//
//  Review.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import UIKit.UIImage


struct Review: Identifiable {
    let id: String
    let authorName: String
    let text: String
    let photos: [UIImage]
    let raiting: Int


    static let mock = Review(
        id: "1",
        authorName: "Геннадий",
        text: "Товар мне понравился, отличное качество для такой цены. Купил две пары. Советую всем!",
        photos: ["shoesPhoto", "runningPhoto", "shoesPhoto", "runningPhoto", "shoesPhoto", "runningPhoto"].map(UIImage.init),
        raiting: 5
    )
}


extension Review {
    static func getReviews(by productId: String) async -> [Review] {
        [
            Review(
                id: "1",
                authorName: "Геннадий",
                text: "Товар мне понравился, отличное качество для такой цены. Купил две пары. Советую всем!",
                photos: ["shoesPhoto", "runningPhoto", "shoesPhoto", "runningPhoto", "shoesPhoto", "runningPhoto"].map(UIImage.init),
                raiting: 5
            ),
            Review(
                id: "2",
                authorName: "Андрей",
                text: "Товар мне понравился, отличное качество для такой цены. Купил две пары. Советую всем!",
                photos: ["shoesPhoto", "runningPhoto"].map(UIImage.init),
                raiting: 3
            ),
            Review(
                id: "4",
                authorName: "Валерий",
                text: "Все в целом хорошо, небольшой косяк на подошве.",
                photos: ["shoesPhoto", "runningPhoto", "shoesPhoto", "runningPhoto", "shoesPhoto", "runningPhoto"].map(UIImage.init),
                raiting: 4
            ),
            Review(
                id: "5",
                authorName: "Геннадий",
                text: "Это худшая обувь всех времен! Никогда больше ее не куплю. Сломал обе ноги!",
                photos: ["runningPhoto"].map(UIImage.init),
                raiting: 2
            ),
            Review(
                id: "6",
                authorName: "Иван",
                text: "С одной стороны это хорошо, а с другой – худшая обувь всех времен! Никогда больше ее не куплю. Сломал обе ноги...",
                photos: ["runningPhoto"].map(UIImage.init),
                raiting: 5
            ),
            Review(
                id: "7",
                authorName: "Антон",
                text: "Норм",
                photos: ["runningPhoto"].map(UIImage.init),
                raiting: 4
            )
        ]
    }
}
