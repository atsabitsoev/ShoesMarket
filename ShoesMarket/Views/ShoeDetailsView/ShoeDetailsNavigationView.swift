//
//  ShoeDetailsNavigationView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct ShoeDetailsNavigationView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding private var tintColor: Color


    init(tint: Binding<Color> = .constant(Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255))) {
        self._tintColor = tint
    }


    var body: some View {
        HStack {
            SquareBarButton(
                state: .back,
                tintColor: $tintColor,
                action: dismiss.callAsFunction
            )
            Spacer()
            Button {} label: {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .foregroundColor(Color.white)
            }
            .buttonStyle(SMButtonStyle(action: {
                print("heart")
            }))
            .frame(width: 56, height: 56)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
    }
}

struct ShoeDetailsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsNavigationView()
            .previewLayout(.sizeThatFits)
    }
}
