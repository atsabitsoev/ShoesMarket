//
//  ShoeDetailsSizeView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsSizeView: View {
    @State private var textColor: Color = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)
    @State private var tintColor: Color = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)
    private let backgroundColor: Color = Color.white

    @State private var sizes: [String] = ["41", "42", "43.5", "45"]
    @State private var selectedIndex: Int = 0
    @State private var touchDownIndex: Int? = nil


    var body: some View {
        VStack(alignment: .leading) {
            Text("SIZES")
                .multilineTextAlignment(TextAlignment.leading)
                .foregroundColor(backgroundColor)
                .bold()
            HStack(spacing: Constants.spacing) {
                ForEach(sizes.indices, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .foregroundColor(getItemColor(index: index))
                        Text(sizes[index])
                            .foregroundColor(textColor)
                            .bold()
                    }
                    .frame(width: Constants.itemSize, height: Constants.itemSize)
                    .onTapGesture {
                        selectedIndex = index
                    }
                    .onLongPressGesture(minimumDuration: 0, maximumDistance: Constants.itemSize) {} onPressingChanged: { press in
                        touchDownIndex = press ? index : nil
                    }

                }
            }
        }
        .padding(.horizontal, Constants.padding)
    }
}


private extension ShoeDetailsSizeView {
    func getItemColor(index: Int) -> Color {
        guard touchDownIndex != index else {
            return Color(white: 0.6)
        }
        return selectedIndex == index ? tintColor : backgroundColor
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
