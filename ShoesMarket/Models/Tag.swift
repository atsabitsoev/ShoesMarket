//
//  Tag.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 19.10.2022.
//

struct Tag {
    let id: String
    let name: String


    static var all: [Tag] {
        get async {
            await getAll()
        }
    }
}


private extension Tag {
    static func getAll() async -> [Tag] {
        return [
            Tag(id: "1", name: "Зимние"),
            Tag(id: "2", name: "Высокие"),
            Tag(id: "3", name: "Черно-белые"),
            Tag(id: "4", name: "Джорданы"),
            Tag(id: "5", name: "Данки")
        ]
    }
}
