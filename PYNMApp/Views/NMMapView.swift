//
//  NMMapView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/20/24.
//

import SwiftUI
import MapKit

struct NMMapView: View {
    @StateObject private var mapViewModel = MapViewModel()
    @StateObject private var cardListViewModel = CardListViewModel()
    @StateObject var navigationManager = NavigationManager()

//    @State var isShowModal = true
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ZStack {
                Map(
                    coordinateRegion: $mapViewModel.region,
                    annotationItems: mapViewModel.places
                ) { place in
                    MapAnnotation(
                        coordinate: place.coordinate
                    ) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white.opacity(0.8))
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.secondary, lineWidth: 2)
                            VStack {
                                Image(systemName: "building.fill")
                                    .foregroundColor(.blue)
                                    .padding(5)
                                Text(place.name)
                                    .font(.caption)
                                    .padding(5)
                            }
                        }
                    }
                }
                .onAppear {
                    mapViewModel.loadPlaces()
                        mapViewModel.isShowModal = true
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Header(navigationManager: navigationManager)
                        .frame(height: 60)
                    
                    Button {
                        mapViewModel.isShowModal = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            navigationManager.resetNavigation()
                            navigationManager.navigateToNMListView()
                                                   }
                    } label: {
                        Text("View List")
                    }
                    .buttonStyle(HeaderButtonStyle())
                    
                    Spacer()

                }
                .overlay(
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.all)
                        .allowsHitTesting(false)
                    , alignment: .top
                )
            }
        }
        .sheet(isPresented: $mapViewModel.isShowModal) {
            CarouselView(viewModel: cardListViewModel, mapViewModel: mapViewModel)
                .presentationDetents([.height(200)])
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .height(200)))
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled(true)
                .presentationBackground(.clear)
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(for: Card.self) { card in
                        NMListView()
                .environmentObject(navigationManager)
                        
                    }


//        .sheet(isPresented: $mapViewModel.isShowModal) {
//            CarouselView(mapViewModel: mapViewModel, cardListViewModel: cardListViewModel)
//                .presentationDetents([.height(150)])
//                .presentationBackground(.clear)
//                .presentationBackgroundInteraction(
//                    .enabled(upThrough: .height(150)))
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled(true)
//        }
    }
    
    
    // MARK: Sticky Header
    struct Header: View {
        @ObservedObject var navigationManager: NavigationManager
        @StateObject private var mapViewModel = MapViewModel()

//        @Binding var isShowModal

        var body: some View {
            VStack {
                Spacer()
                    Image(systemName: "photo.fill")
                        .font(.largeTitle)
                
                Spacer()
                Divider()
            }

            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 60)
            .background(Rectangle().foregroundColor(.white))
        }
    }
}

#Preview {
    NMMapView()
}
