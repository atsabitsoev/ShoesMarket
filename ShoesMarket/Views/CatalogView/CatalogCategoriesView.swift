//
//  CatalogCategoriesView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 04.10.2022.
//

import SwiftUI

struct CatalogCategoriesView: View {
    @State private var categories: [String] = ["Basketball", "Running", "Training", "Hellowing"]
    @State private var selectedIndex: Int = 0
    @State private var offsetX: CGFloat = 0

    @State private(set) var secondaryColor: Color = Color(white: 0.6)
    @State private(set) var selectionColor: Color = Color(.displayP3, red: 247/255, green: 202/255, blue: 10/255)


    private let scrollDelegate = CategoriesScrollViewDelegate()


    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { proxy in
            HStack(spacing: 24) {
                ForEach(categories.indices, id: \.self) { index in
                    Text(categories[index])
                        .font(Font.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(index == selectedIndex ? selectionColor : secondaryColor)
                        .onTapGesture {
                            selectedIndex = index
                            proxy.scrollTo(selectedIndex)
                        }
                        .scrollId(index)
                }
            }
            .padding(24)
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
        }
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
