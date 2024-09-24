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
                Header()
                
                Spacer()
            }
            HStack(alignment: .top) {
                Spacer()
                // MARK: View Change Button
                Button(action: {
                    toggleView()
                }) {
                    Text(currentView == .mapView ? "View List" : "View Map")
                }
                .buttonStyle(HeaderButtonStyle())
                .padding(.top, 10)
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
    struct Header: View {
        var body: some View {
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
}


#Preview {
    NMMainView()
}
