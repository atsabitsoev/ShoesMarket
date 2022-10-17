//
//  BackgroundBlurView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 17.10.2022.
//

import SwiftUI

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let effect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: effect)

        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
