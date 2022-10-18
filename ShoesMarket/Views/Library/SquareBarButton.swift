//
//  BackButton.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 14.10.2022.
//

import SwiftUI

enum SquareBarButtonState {
    case back
    case close

    func imageName() -> String {
        switch self {
        case .back:
            return "chevron.left"
        case .close:
            return "xmark"
        }
    }
}


struct SquareBarButton: View {
    @Binding private var tintColor: Color


    private let state: SquareBarButtonState
    private let action: () -> Void


    init(
        state: SquareBarButtonState,
        tintColor: Binding<Color> = .constant(.blue),
        action: @escaping () -> Void = {}
    ) {
        self.state = state
        self._tintColor = tintColor
        self.action = action
    }


    var body: some View {
        Button {} label: {
            Image(systemName: state.imageName())
                .frame(width: 40, height: 40)
                .background(Color.white)
                .bold()
                .foregroundColor(tintColor)
                .cornerRadius(8)
                .shadow(radius: 10)
        }
        .buttonStyle(SMButtonStyle(action: action))
        .frame(width: 56, height: 56)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        SquareBarButton(state: SquareBarButtonState.close)
    }
}
