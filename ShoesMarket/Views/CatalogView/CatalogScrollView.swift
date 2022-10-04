//
//  CatalogScrollView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 30.09.2022.
//

import SwiftUI
import Combine
import ScrollViewProxy

struct CatalogScrollView: View {
    @State private var offsetX: CGFloat = 0
    @State private var items: [Int] = [0, 1, 2, 3, 4, 5]


    private let scrollDelegate: CatalogScrollViewDelegate = CatalogScrollViewDelegate()

    private let idealOffset: CGFloat = (UIScreen.main.bounds.width - CatalogItemView.Constants.width) / 2


    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { proxy in
            LazyHStack(alignment: .center, spacing: Constants.spacing) {
                ForEach(items, id: \.description) { index in
                    CatalogItemView()
                        .scaleEffect(getItemScale(index: index))
                        .blur(radius: abs(getItemScale(index: index) - 1) * 10)
                        .scrollId(index)
                }
            }
            .padding(EdgeInsets(top: 0, leading: idealOffset, bottom: 32, trailing: idealOffset))
            .onReceive(proxy.offset, perform: { offsetX = $0.x })
            .onAppear {
                scrollDelegate.onEndDecelerating = {
                    let maxOffsetX: CGFloat = CGFloat(items.count - 1) * (CatalogItemView.Constants.width + Constants.spacing)
                    guard offsetX >= 0 && offsetX <= maxOffsetX else { return }
                    proxy.scrollTo(getIndexBy(offsetX))
                }
                scrollDelegate.onEndDragging = { willDecelerate in
                    if !willDecelerate {
                        proxy.scrollTo(getIndexBy(offsetX))
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


final class CatalogScrollViewDelegate: NSObject, UIScrollViewDelegate {
    var onEndDragging: ((_ willDecelerate: Bool) -> Void)?
    var onEndDecelerating: (() -> Void)?


    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        onEndDragging?(decelerate)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onEndDecelerating?()
    }
}


private extension CatalogScrollView {
    func getItemScale(index: Int) -> CGFloat {
        let itemOffset: CGFloat = idealOffset + CGFloat(index) * (CatalogItemView.Constants.width + Constants.spacing) - offsetX
        let difference: CGFloat = abs(itemOffset - idealOffset)
        let maxDifference: CGFloat = UIScreen.main.bounds.width - idealOffset
        let k: CGFloat = Constants.itemMinScale + (1 - Constants.itemMinScale) * (1 - min(1, difference/maxDifference))
        return k
    }

    func getIndexBy(_ offset: CGFloat) -> Int {
        if offset < 125 { return 0 }
        let result = Int((offset - idealOffset * 2 + 10) / (CatalogItemView.Constants.width + Constants.spacing)) + 1
        return result
    }
}


private extension CatalogScrollView {
    enum Constants {
        static let spacing: CGFloat = 8
        static let itemMinScale: CGFloat = 0.7
    }
}


struct CatalogScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScrollView()
            .background(Color(white: 0.1))
            .previewLayout(.sizeThatFits)
    }
}
