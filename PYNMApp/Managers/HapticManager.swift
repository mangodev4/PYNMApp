//
//  HapticManager.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import SwiftUI

    final class HapticManager {
        static let shared = HapticManager()
        private init() { }
        
        private let heavy = UIImpactFeedbackGenerator(style: .heavy)
        private let medium = UIImpactFeedbackGenerator(style: .medium)
        
        func heavyHaptic() {
            heavy.impactOccurred()
        }
        func mediumHaptic() {
            medium.impactOccurred()
        }
    }
