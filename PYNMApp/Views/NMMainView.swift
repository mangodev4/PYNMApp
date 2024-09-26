//
//  NMMainView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/24/24.
//

import SwiftUI

enum ViewState {
    case mapView
    case listView
}

struct NMMainView: View {
    @State private var isPressed = false
    @State private var currentView: ViewState = .mapView
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                if currentView == .mapView {
                    NMMapView()
                } else {
                    NMListView()
                }
                Spacer()
            }
            VStack {
                Header
                
                Spacer()
            }
            HStack(alignment: .top) {
                Spacer()
                ViewToggleButton(
                    currentView: $currentView,
                    isPressed: $isPressed,
                    toggleView: toggleView
                )
            }
        }
        .overlay(
            Rectangle()
                .foregroundColor(.white)
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .edgesIgnoringSafeArea(.all)
                .allowsHitTesting(false)
            , alignment: .top
        )
        .animation(.easeInOut, value: currentView)
    }
    
    private func toggleView() {
        currentView = (currentView == .mapView) ? .listView : .mapView
    }
    
    // MARK: Sticky Header
    @ViewBuilder
    private var Header: some View {
            ZStack {
                VStack {
                    Spacer()
                    Image(systemName: "photo.fill")
                        .font(.largeTitle)
                    
                    Spacer()
                    Divider()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 60)
            .background(Rectangle().foregroundColor(.white))
    }
}

// MARK: View Change Button
struct ViewToggleButton: View {
    @Binding var currentView: ViewState
    @Binding var isPressed: Bool
    
    var toggleView: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                toggleView()
            }
        }) {
            Text(currentView == .mapView ? "View List" : "View Map")
                .frame(width: 100)
                .scaleEffect(isPressed ? 0.9 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        }
        .buttonStyle(HeaderButtonStyle())
        .padding(.top, 10)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        isPressed = false
                    }
                }
        )
    }
}


#Preview {
    NMMainView()
}
