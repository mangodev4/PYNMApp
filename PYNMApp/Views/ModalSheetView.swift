//
//  ModalSheetView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/13/24.
//

import SwiftUI

struct ModalSheetView: View {
    @ObservedObject var viewModel: MapViewModel
    
    var body: some View {
            Button {
                withAnimation {
                    viewModel.movePlace()
                }
            } label: {
                Text("Teleport")
            }
            .frame(width: 350)
            .buttonStyle(OnboardingButtonStyle())
    }
}

#Preview {
    ModalSheetView(viewModel: MapViewModel())
}
