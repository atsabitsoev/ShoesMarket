//
//  ShoeDetailsStarsView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 07.10.2022.
//

import SwiftUI

struct ShoeDetailsStarsView: View {
    @State private var tintColor = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)
    private var backgroundColor = Color.white

    private let totalStars: Int = 5
    private let raiting: CGFloat = 4.5


    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(backgroundColor)
                .frame(
                    width: calculateViewWidth(),
                    height: 12
                )
            Rectangle()
                .foregroundColor(tintColor)
                .frame(
                    width: calculateRaitingViewWidth(),
                    height: 12
                )
        }
        .mask {
            HStack(spacing: Constants.spacing) {
                ForEach(0..<totalStars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .padding(.horizontal, 24)
        .shadow(radius: 10)
    }
}


private extension ShoeDetailsStarsView {
    func calculateViewWidth() -> CGFloat {
        Constants.starSize * CGFloat(totalStars) + Constants.spacing * CGFloat(totalStars - 1)
    }

    func calculateRaitingViewWidth() -> CGFloat {
        let starCount = Int(raiting)
        let rest: CGFloat = raiting.truncatingRemainder(dividingBy: 1)
        let additionalWidth: CGFloat = rest != 0 ? CGFloat(starCount) * Constants.spacing : CGFloat(starCount - 1) * Constants.spacing
        let result = Constants.starSize * CGFloat(totalStars) / 5 * raiting + additionalWidth
        return result
    }
}


private extension ShoeDetailsStarsView {
    enum Constants {
        static let starSize: CGFloat = 12
        static let spacing: CGFloat = 8
    }
}


struct ShoeDetailsStarsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsStarsView()
            .background(Color.black)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
