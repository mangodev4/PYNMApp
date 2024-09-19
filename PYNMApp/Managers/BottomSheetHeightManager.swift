//
//  BottomSheetHeightManager.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/19/24.
//

import Foundation
import SwiftUI

class BottomSheetHeightManager: ObservableObject {
    @Published var currentHeight: PresentationDetent = .height(170)
    
    func toggleHeight() {
        withAnimation {
            currentHeight = (currentHeight == .height(170)) ? .height(650) : .height(170)
        }
    }
}
