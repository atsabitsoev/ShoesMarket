//
//  ContentView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 29.09.2022.
//

import SwiftUI

struct SMTabBar: View {
    @State var selectedItem: Int = 0

    @State private var circlePosition: CGPoint = .zero

    @Binding private var tintColor: Color
    @Binding private var backgroundColor: Color

    private let icons: [String] = ["home", "circle", "user"]
    private let totalItems: Int = 3


    init(
        tintColor: Binding<Color> = .constant(Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)),
        backgroundColor: Binding<Color> = .constant(Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255))
    ) {
        self._tintColor = tintColor
        self._backgroundColor = backgroundColor
    }


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: RoundedCornerStyle.continuous)
                .foregroundColor(backgroundColor)
            GeometryReader { geometry in
                Circle()
                    .frame(width: Constants.circleSize)
                    .position(
                        x: getCirclePosition(barWidth: geometry.size.width),
                        y: Constants.barHeight / 2
                    )
                    .animation(Animation.spring(response: 1, dampingFraction: 0.5).speed(5), value: selectedItem)
                    .foregroundColor(tintColor)
            }
            HStack(spacing: 0) {
                ForEach(0..<totalItems, id: \.self) { id in
                    SMTabBarItem(
                        iconName: icons[id],
                        isSelected: checkSelectionBinding(item: id),
                        selectedColor: $backgroundColor,
                        unSelectedColor: $tintColor
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedItem = id
                        let generator = UISelectionFeedbackGenerator()
                        generator.selectionChanged()
                    }
                }
            }
        }
        .frame(height: Constants.barHeight)
    }
}


private extension SMTabBar {
    func getCirclePosition(barWidth: CGFloat) -> CGFloat {
        let itemsCount: CGFloat = CGFloat(totalItems)
        let itemSize: CGFloat = barWidth / itemsCount
        let zeroPoint: CGFloat = itemSize / 2
        let selectedItem: CGFloat = CGFloat(selectedItem)
        let result: CGFloat = zeroPoint + itemSize * selectedItem
        return result
    }

    func checkSelectionBinding(item: Int) -> Binding<Bool> {
        Binding(
            get: {
                $selectedItem.wrappedValue == item
            }, set: { newValue in
                selectedItem = item
            })
    }
}


private extension SMTabBar {
    enum Constants {
        static let circleSize: CGFloat = 64
        static let barHeight: CGFloat = 116
        static let cornerRadius: CGFloat = 44
    }
}


struct SMTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SMTabBar()
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
