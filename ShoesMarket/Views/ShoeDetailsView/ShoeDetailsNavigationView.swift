//
//  ShoeDetailsNavigationView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct ShoeDetailsNavigationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private(set) var tintColor: Color = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)


    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .bold()
                    .foregroundColor(tintColor)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
            .frame(width: 56, height: 56)
            Spacer()
            Button {
                print("heart")
            } label: {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .foregroundColor(Color.white)
            }
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
