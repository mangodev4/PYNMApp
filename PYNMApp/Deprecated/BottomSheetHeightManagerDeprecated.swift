////
////  BottomSheetHeightManager.swift
////  PYNMApp
////
////  Created by Yujin Son on 9/19/24.
////
//
//import Foundation
//import SwiftUI
//
//enum BottomSheetState {
//    case collapsed
//    case expanded
//    case custom(height: CGFloat)
//    
//    var presentationDetent: PresentationDetent {
//        switch self {
//        case .collapsed:
//            return .height(170)
//        case .expanded:
//            return .height(700)
//        case .custom(let height):
//            return .height(height)
//        }
//    }
//}
//
//class BottomSheetHeightManager: ObservableObject {
//    @Published var currentHeight: BottomSheetState = .collapsed
//    
//    func changeHeight(to state: BottomSheetState) {
//        withAnimation {
//            currentHeight = state
//        }
//    }
//}
