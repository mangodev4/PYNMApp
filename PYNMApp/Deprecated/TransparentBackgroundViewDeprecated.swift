//
//  TransparentBackgroundView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/13/24.
//

//    // MARK: 배경 색 CLEAR 전역 적용
//import SwiftUI
//
//struct TransparentBackgroundView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//        DispatchQueue.main.async {
//            view.superview?.superview?.backgroundColor = .clear
//        }
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {}
//}
//
//class ClearBackgroundView: UIView {
//    open override func layoutSubviews() {
//        guard let parentView = superview?.superview else {
//            return
//        }
//        parentView.backgroundColor = .clear
//    }
//}
