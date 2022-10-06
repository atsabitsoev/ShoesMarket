//
//  ShoeDetailsView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct ShoeDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragOffset = CGSize.zero
    @State private(set) var backgroundColor: Color = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)
    @State private(set) var tintColor: Color = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)

    @State private var selectedPhotoIndex: Int = 0
    @State private var images: [UIImage] = [UIImage(named: "nikeShoe")!, UIImage(named: "shoesPhoto")!, UIImage(named: "runningPhoto")!]


    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            Circle()
                .foregroundColor(tintColor)
                .frame(width: UIScreen.main.bounds.width * 1.2)
                .position(x: UIScreen.main.bounds.width / 9 * 8, y: 80)
            VStack(spacing: 8) {
                ShoeDetailsNavigationView()
                GeometryReader { geo in
                    VStack(spacing: 12) {
                        ZStack {
                            Text("NIKE AIR")
                                .font(Font.system(size: UIScreen.main.bounds.width / 5))
                                .foregroundColor(Color.white)
                                .bold()
                            ShoeDetailsPhotosView($selectedPhotoIndex)
                        }
                        .frame(width: geo.size.width, height: geo.size.height / 2)
                        ShoeDetailsPhotoIndicatorView($selectedPhotoIndex, totalItems: images.count)
                    }
                }
                Spacer()
            }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .updating(
                    $dragOffset,
                    body: { (value, state, transaction) in
                        if value.startLocation.x < 20 {
                            dismiss()
                        }
                    }
                )
        )
    }
}

struct ShoeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailsView()
    }
}
