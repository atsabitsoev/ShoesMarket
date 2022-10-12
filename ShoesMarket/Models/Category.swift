//
//  Category.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 12.10.2022.
//


struct Category {
    let id: String
    let name: String


    static var all: [Category] {
        get async {
            await getAll()
        }
    }
}


private extension Category {
    static func getAll() async -> [Category] {
        return [
            Category(id: "1", name: "Баскетбол"),
            Category(id: "2", name: "Бег"),
            Category(id: "3", name: "Тренировка"),
            Category(id: "4", name: "Прогулка")
        ]
    }
}
