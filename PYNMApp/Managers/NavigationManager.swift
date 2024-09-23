//
//  NavigationManager.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/5/24.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
//    func navigateToCardDetail(card: Card) {
//        path.append(card)
//    }
    
    func navigateToMapView(selectedCard: Card) {
        path.append(selectedCard)
    }
    
    func goBack() {
        DispatchQueue.main.async {
            if self.path.count > 0 {
                self.path.removeLast()
            } else {
                print("Navigation path is empty. Can't go back.")
            }
        }
    }
    
    func resetNavigation() {
        path.removeLast(path.count)
    }
}
