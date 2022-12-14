//
//  CatalogCategoriesView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct CatalogCategoriesView: View {
    @State private var selectedIndex: Int = 0
    @State private var offsetX: CGFloat = 0

    @Binding private var categories: [Category]
    @Binding private var secondaryColor: Color
    @Binding private var selectionColor: Color


    private let scrollDelegate = CategoriesScrollViewDelegate()
    private let onCategorySelected: (Category) -> Void


    init(
        categories: Binding<[Category]> = .constant([]),
        selectionColor: Binding<Color> = .constant(Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)),
        secondaryColor: Binding<Color> = .constant(Color(white: 0.6)),
        onCategorySelected: @escaping (Category) -> Void = { _ in }
    ) {
        self._categories = categories
        self._selectionColor = selectionColor
        self._secondaryColor = secondaryColor
        self.onCategorySelected = onCategorySelected
    }


    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { proxy in
            HStack(spacing: 24) {
                ForEach(categories.indices, id: \.self) { index in
                    Button(action: {}) {
                        Text(categories[index].name)
                            .shadow(radius: 10)
                            .font(Font.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(index == selectedIndex ? selectionColor : secondaryColor)
                    }
                    .buttonStyle(
                        SMButtonStyle(
                            action: {
                                selectedIndex = index
                                proxy.scrollTo(selectedIndex)
                                onCategorySelected(categories[index])
                            },
                            animateHighlight: false
                        )
                    )
                    .scrollId(index)
                }
            }
            .padding(.horizontal, 24)
            .onReceive(proxy.offset, perform: { offsetX = $0.x })
            .onAppear {
                scrollDelegate.onEndDecelerating = {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        proxy.scrollTo(selectedIndex)
                    }
                }
                scrollDelegate.onEndDragging = {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        proxy.scrollTo(selectedIndex)
                    }
                }
            }
            .padding(24)
        }
        .padding(-24)
        .introspectScrollView { scrollView in
            scrollView.delegate = scrollDelegate
            scrollView.decelerationRate = .init(rawValue: 0.9)
        }
    }
}


final class CategoriesScrollViewDelegate: NSObject, UIScrollViewDelegate {
    var onEndDragging: (() -> Void)?
    var onEndDecelerating: (() -> Void)?


    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard !decelerate else { return }
        onEndDragging?()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onEndDecelerating?()
    }
}


struct CatalogCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogCategoriesView()
            .background(Color(white: 0.2))
            .previewLayout(.sizeThatFits)
    }
}
