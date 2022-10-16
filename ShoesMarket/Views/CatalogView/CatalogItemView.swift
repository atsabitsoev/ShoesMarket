 //
//  CatalogItemView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogItemView: View {
    @Binding private var item: Product
    private var textColor = Color.white
    @State private var touchDown: Bool = false

    private let errorImage = UIImage(systemName: "heart")!
    private let onItemTap: () -> Void


    init(
        item: Binding<Product>,
        onItemTap: @escaping () -> Void = {}
    ) {
        self._item = item
        self.onItemTap = onItemTap
    }


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .foregroundColor(item.variants.first!.themeColors.averageColor)
            VStack(spacing: Constants.spacing) {
                HStack {
                    Text(item.title.uppercased())
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
                        .shadow(radius: 10)
                    Spacer()
                }
                HStack {
                    Text(item.subtitle.uppercased())
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .truncationMode(.middle)
                        .bold()
                        .foregroundColor(textColor)
                        .shadow(radius: 10)
                    Spacer()
                }
                HStack {
                    Text(item.costLabel)
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
                        .shadow(radius: 10)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(item.title.uppercased())
                        .lineLimit(2)
                        .multilineTextAlignment(TextAlignment.leading)
                        .minimumScaleFactor(0.5)
                        .font(Font(CTFont(.label, size: 72)))
                        .foregroundColor(Color(white: 1, opacity: 0.3))
                        .bold()
                    Spacer()
                }
                Spacer()
            }
            .padding(Constants.padding)
            Image(uiImage: item.variants.first?.mainImage ?? errorImage)
                .resizable()
                .scaledToFit()
                .rotationEffect(Constants.shoeRotation)
                .frame(width: Constants.width)
                .padding(.top, 40)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 20)
            Button(action: {
                onItemTap()
            }, label: { Color.clear })
            ._onButtonGesture(pressing: { val in
                withAnimation(Animation.easeInOut(duration: 0.2)) {
                    touchDown = val
                }
            }, perform: {})
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CatalogAddButton(
                        plusColor: Binding(get: {
                            getAddButtonPlusColor()
                        }, set: { _ in }),
                        backgroundColor: Binding(get: {
                            getAddButtonBgColor()
                        }, set: { _ in })
                    ) {
                        print("add to cart")
                    }
                    .frame(width: 100, height: 80)
                }
            }
        }
        .frame(width: Constants.width, height: Constants.height)
        .scaleEffect(touchDown ? 0.95 : 1)
    }
}


private extension CatalogItemView {
    func getAddButtonPlusColor() -> Color {
        guard let firstItemVariant = item.variants.first else { return .black }
        return firstItemVariant.themeColors.detailColor
    }

    func getAddButtonBgColor() -> Color {
        guard let firstItemVariant = item.variants.first else { return .black }
        return firstItemVariant.themeColors.secondaryColor
    }
}


extension CatalogItemView {
    enum Constants {
        static let width: CGFloat = 250
        static let height: CGFloat = 380
        
        fileprivate static let spacing: CGFloat = 6
        fileprivate static let padding: EdgeInsets = EdgeInsets(top: 44, leading: 24, bottom: 24, trailing: 24)
        fileprivate static let cornerRadius: CGFloat = 44
        fileprivate static let shoeRotation: Angle = Angle.degrees(-30)
    }
}


struct CatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogItemView(item: .constant(Product.mock))
        .background(Color.init(white: 0.1))
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
