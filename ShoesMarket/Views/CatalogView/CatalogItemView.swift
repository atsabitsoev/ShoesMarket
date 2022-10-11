//
//  CatalogItemView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI

struct CatalogItemView: View {
    @Binding private var item: Product
    @State private var textColor = Color(.displayP3, red: 22/255, green: 24/255, blue: 24/255)

    private let errorImage = UIImage(systemName: "heart")!


    init(item: Binding<Product>) {
        self._item = item
    }


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .foregroundColor(Color.white)
            VStack(spacing: Constants.spacing) {
                HStack {
                    Text(item.title.uppercased())
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
                    Spacer()
                }
                HStack {
                    Text(item.subtitle.uppercased())
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .truncationMode(.middle)
                        .bold()
                        .foregroundColor(textColor)
                    Spacer()
                }
                HStack {
                    Text(item.costLabel)
                        .multilineTextAlignment(TextAlignment.leading)
                        .bold()
                        .foregroundColor(textColor)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(item.title.uppercased())
                        .lineLimit(2)
                        .multilineTextAlignment(TextAlignment.leading)
                        .minimumScaleFactor(0.5)
                        .font(Font(CTFont(.label, size: 72)))
                        .foregroundColor(Color(white: 0.9))
                        .bold()
                    Spacer()
                }
                Spacer()
            }
            .padding(Constants.padding)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CatalogAddButton(
                        plusColor: getAddButtonPlusColor(),
                        backgroundColor: getAddButtonBgColor()
                    ) {
                        print("hello")
                    }
                    .frame(width: 80, height: 80)
                }
            }
            Image(uiImage: item.variants.first?.mainImage ?? errorImage)
                .resizable()
                .scaledToFit()
                .rotationEffect(Constants.shoeRotation)
                .frame(width: Constants.width)
                .padding(.top, 40)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 20)
        }
        .frame(width: Constants.width, height: Constants.height)
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
        CatalogItemView(item: .constant(Product(
            id: "2",
            title: "Nike air",
            subtitle: "air jordan 1 retro high",
            cost: 1099,
            raiting: 3.5,
            variants: [
                Product.Variant(
                    mainImage: UIImage(named: "redShoe")!,
                    images: ["runningPhoto", "shoesPhoto"].map(UIImage.init),
                    sizes: ["41", "42", "43.5", "45"],
                    shoeColor: .red
                )
            ]
        )))
        .background(Color.init(white: 0.1))
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
