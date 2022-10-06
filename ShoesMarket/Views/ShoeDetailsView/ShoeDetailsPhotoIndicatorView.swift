//
//  ShoeDetailsPhotoIndicatorView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 06.10.2022.
//

import SwiftUI

struct ShoeDetailsPhotoIndicatorView: View {
    @Binding var currentIndex: Int
    @State var totalItems: Int


    init(_ index: Binding<Int>, totalItems: Int) {
        self._currentIndex = index
        self.totalItems = totalItems
    }


    var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(0..<totalItems, id: \.self) { index in
                RoundedRectangle(cornerRadius: Constants.dotHeight / 2)
                    .frame(
                        width: index == currentIndex ? Constants.selectedDotWidth : Constants.dotHeight,
                        height: Constants.dotHeight
                    )
                    .animation(Animation.easeInOut, value: currentIndex)
                    .foregroundColor(index == currentIndex ? Color.white : Color(white: 0.6))
            }
        }
    }
}


private extension ShoeDetailsPhotoIndicatorView {
    enum Constants {
        static let dotHeight: CGFloat = 8
        static let selectedDotWidth: CGFloat = 32
        static let spacing: CGFloat = 8
    }
}


struct ShoeDetailsPhotoIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsPhotoIndicatorView(.constant(0), totalItems: 4)
            .previewLayout(.sizeThatFits)
    }
}
