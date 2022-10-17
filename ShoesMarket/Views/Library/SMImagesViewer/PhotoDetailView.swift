//
//  PhotoDetailView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 17.10.2022.
//

import SwiftUI
import PDFKit

struct PhotoDetailView: UIViewRepresentable {
    private let image: UIImage
    private let width: CGFloat


    init(
        image: UIImage,
        width: CGFloat
    ) {
        self.image = image
        self.width = width
    }


    func makeUIView(context: Context) -> PDFView {
        let view = PDFView()
        view.document = PDFDocument()
        guard let page = PDFPage(image: image) else { return view }
        view.document?.insert(page, at: 0)
        view.autoScales = true
        view.displayMode = .singlePageContinuous
        view.displayDirection = .horizontal
        view.usePageViewController(true, withViewOptions: nil)
        view.minScaleFactor = (width / image.size.width)
        view.maxScaleFactor = view.minScaleFactor * 3
        view.backgroundColor = .clear
        let pdfScrollView: UIScrollView? = view.subviews.compactMap({ $0 as? UIScrollView }).first
        pdfScrollView?.showsVerticalScrollIndicator = false
        pdfScrollView?.showsHorizontalScrollIndicator = false
        return view
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // empty
    }
}
