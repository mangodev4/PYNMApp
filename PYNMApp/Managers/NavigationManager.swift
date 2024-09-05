//
//  NavigationManager.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/5/24.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigateToCardDetail(card: Card) {
        path.append(card)
    }
    
    func goBack() {
            path.removeLast()
        }
    
    func resetNavigation() {
        path.removeLast(path.count)
    }
}
