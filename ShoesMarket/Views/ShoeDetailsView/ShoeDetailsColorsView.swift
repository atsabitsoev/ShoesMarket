//
//  ShoeDetailsColorsView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsColorsView: View {
    @State private var colors: [Color]
    @Binding private var selectedIndex: Int


    private let textColor = Color.white
    private let borderColor = Color.white


    init(
        colors: [Color] = [
            Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255),
            Color.green,
            Color.blue
        ],
        selectedIndex: Binding<Int> = .constant(0)
    ) {
        self._selectedIndex = selectedIndex
        self.colors = colors
    }


    var body: some View {
        VStack(alignment: .leading) {
            Text("COLOR")
                .multilineTextAlignment(TextAlignment.leading)
                .foregroundColor(textColor)
                .bold()
            HStack(spacing: Constants.spacing) {
                ForEach(colors.indices, id: \.self) { index in
                    ZStack {
                        if index == selectedIndex {
                            Circle()
                                .foregroundColor(borderColor)
                                .shadow(radius: 2)
                                .frame(
                                    width: Constants.itemSize + Constants.borderSize,
                                    height: Constants.itemSize + Constants.borderSize
                                )
                        }
                        Circle()
                            .foregroundColor(colors[index])
                            .frame(width: Constants.itemSize)
                    }
                    .frame(
                        width: Constants.itemSize + Constants.borderSize,
                        height: Constants.itemSize + Constants.borderSize
                    )
                    .onTapGesture {
                        selectedIndex = index
                    }
                }
            }
        }
        .padding(.horizontal, Constants.padding)
    }
}


private extension ShoeDetailsColorsView {
    enum Constants {
        static let itemSize: CGFloat = 20
        static let borderSize: CGFloat = 8
        static let spacing: CGFloat = 16
        static let padding: CGFloat = 24
    }
}


struct ShoeDetailsColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsColorsView()
            .background(Color.gray)
    }
}
