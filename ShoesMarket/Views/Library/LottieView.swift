//
//  LottieView.swift
//  ShoesMarket
//
//  Created by Ацамаз Бицоев on 19.10.2022.
//


import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    private let lottieFile: String

    private let animationView = LottieAnimationView()
    private var delegate: LottieViewDelegate {
        get {
            LottieViewDelegate.sharedInstance(animationView: animationView)
        }
    }


    init(lottieFile: String) {
        self.lottieFile = lottieFile
    }


    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .autoReverse
        animationView.play()

        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        let _ = delegate

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}


fileprivate final class LottieViewDelegate {

    static private var shared: LottieViewDelegate?


    private var animationView: LottieAnimationView


    private init(animationView: LottieAnimationView) {
        self.animationView = animationView
        NotificationCenter.default.addObserver(self, selector: #selector(onEnterForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
    }


    static func sharedInstance(animationView: LottieAnimationView) -> LottieViewDelegate {
        if let shared = LottieViewDelegate.shared {
            shared.animationView = animationView
            return shared
        } else {
            LottieViewDelegate.shared = LottieViewDelegate(animationView: animationView)
            return LottieViewDelegate.shared!
        }
    }


    @objc private func onEnterForeground() {
        animationView.play()
    }
}
