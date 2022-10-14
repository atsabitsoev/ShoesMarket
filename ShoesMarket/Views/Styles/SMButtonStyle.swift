//
//  SMButtonStyle.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//


import SwiftUI

struct SMButtonStyle: ButtonStyle {
    @State private var touchDown: Bool = false

    private let action: () -> Void
    private let animateHighlight: Bool


    init(
        action: @escaping () -> Void,
        animateHighlight: Bool = true
    ) {
        self.action = action
        self.animateHighlight = animateHighlight
    }


    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            ._onButtonGesture { val in
                touchDown = val
            } perform: {
                action()
            }
            .opacity(touchDown ? 0.5 : 1)
            .animation(touchDown || !animateHighlight ? nil : .linear, value: touchDown)
    }
}
