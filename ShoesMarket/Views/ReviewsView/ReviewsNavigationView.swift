//
//  ReviewsNavigationView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

struct ReviewsNavigationView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding private var tintColor: Color


    init(tint: Binding<Color> = .constant(Color.blue)) {
        self._tintColor = tint
    }


    var body: some View {
        HStack {
            BackButton(
                tintColor: $tintColor,
                action: dismiss.callAsFunction
            )
            Spacer()
            Text("Отзывы")
                .title()
            Spacer()
            Spacer()
            .frame(width: 56, height: 56)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
    }
}

struct ReviewsListNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsNavigationView()
            .background(Color.yellow)
            .previewLayout(.sizeThatFits)
    }
}
