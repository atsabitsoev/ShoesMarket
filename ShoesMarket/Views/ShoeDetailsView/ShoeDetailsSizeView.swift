//
//  ShoeDetailsSizeView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsSizeView: View {
    @Binding private var textColor: Color
    @Binding private var tintColor: Color
    @State private var backgroundColor: Color

    @Binding private var sizes: [String]
    @State private var selectedIndex: Int = 0


    init(
        sizes: Binding<[String]> = .constant([]),
        textColor: Binding<Color> = .constant(Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)),
        tintColor: Binding<Color> = .constant(Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)),
        backgroundColor: Color = Color.white
    ) {
        self._sizes = sizes
        self._textColor = textColor
        self._tintColor = tintColor
        self.backgroundColor = backgroundColor
    }


    var body: some View {
        VStack(alignment: .leading) {
            Text("РАЗМЕР")
                .multilineTextAlignment(TextAlignment.leading)
                .foregroundColor(Color.white)
                .bold()
                .shadow(radius: 10)
            HStack(spacing: Constants.spacing) {
                ForEach(sizes.indices, id: \.self) { index in
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                                .foregroundColor(selectedIndex == index ? tintColor : backgroundColor)
                            Text(sizes[index])
                                .foregroundColor(index == selectedIndex ? textColor : tintColor)
                                .bold()
                        }
                    }
                    .buttonStyle(
                        SMButtonStyle(
                            action: {
                                selectedIndex = index
                            },
                            animateHighlight: false
                        )
                    )
                    .frame(width: Constants.itemSize, height: Constants.itemSize)
                }
            }
        }
        .onChange(of: sizes, perform: { _ in
            selectedIndex = 0
        })
        .padding(.horizontal, Constants.padding)
    }
}


private extension ShoeDetailsSizeView {
    enum Constants {
        static let cornerRadius: CGFloat = 8
        static let itemSize: CGFloat = 44
        static let spacing: CGFloat = 24
        static let padding: CGFloat = 24
    }
}


struct ShoeDetailsSizeView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsSizeView()
            .background(Color.gray)
    }
}
