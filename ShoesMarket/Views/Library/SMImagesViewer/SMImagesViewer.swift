//
//  SMImagesViewer.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 16.10.2022.
//

import SwiftUI
import PDFKit

struct SMImagesViewer: View {
    @GestureState private var dragGestureActive: Bool = false
    @Binding private var isPresented: Bool
    @State private var currentVerticalInset: CGFloat = 0
    @State private var selectedIndex: Int = 0

    private let startSelectedIndex: Int
    private let images: [UIImage]


    init(
        isPresented: Binding<Bool> = .constant(true),
        images: [UIImage] = ["runningPhoto", "shoesPhoto"].map(UIImage.init),
        startSelectedIndex: Int = 0
    ) {
        self._isPresented = isPresented
        self.images = images
        self.startSelectedIndex = startSelectedIndex
    }


    var body: some View {
        ZStack {
            Color.black.opacity(1.0 - abs(currentVerticalInset) / UIScreen.main.bounds.height)
            TabView(selection: $selectedIndex) {
                ForEach(images.indices, id: \.self) { index in
                    GeometryReader { geo in
                        PhotoDetailView(image: images[index], width: geo.size.width)
                    }
                }
                .ignoresSafeArea()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .offset(y: currentVerticalInset)
        }
        .onAppear {
            selectedIndex = startSelectedIndex
        }
        .ignoresSafeArea()
        .background(
            BackgroundBlurView()
                .ignoresSafeArea()
                .opacity(1.0 - abs(currentVerticalInset) / UIScreen.main.bounds.height)
        )
        .simultaneousGesture(
            DragGesture(minimumDistance: 20)
                .updating($dragGestureActive, body: { val, state, transaction in
                    state = true
                })
                .onChanged({ val in
                    withAnimation {
                        currentVerticalInset = val.translation.height
                    }
                })
                .onEnded({ val in
                    onDragEnd(finishInset: val.predictedEndTranslation.height)
                })
        )
        .onChange(of: dragGestureActive) { newValue in
            if !dragGestureActive || !newValue {
                onDragEnd(finishInset: currentVerticalInset)
            }
        }
    }
}


private extension SMImagesViewer {
    func onDragEnd(finishInset: CGFloat) {
        let insetToDismiss: CGFloat = 200
        let shouldDismiss: Bool = abs(finishInset) >= insetToDismiss
        withAnimation {
            if shouldDismiss {
                dismiss()
            } else {
                resetVerticalInset()
            }
        }
    }

    func resetVerticalInset() {
        withAnimation {
            currentVerticalInset = 0
        }
    }

    func dismiss() {
        withAnimation(.linear(duration: 0.3)) {
            currentVerticalInset = currentVerticalInset / abs(currentVerticalInset) * UIScreen.main.bounds.height
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
        }
    }
}


struct SMImagesViewer_Previews: PreviewProvider {
    static var previews: some View {
        SMImagesViewer()
    }
}
