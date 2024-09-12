//
//  MainView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/12/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            MapView()
            NMListView()
        }
    }
}

#Preview {
    MainView()
}
