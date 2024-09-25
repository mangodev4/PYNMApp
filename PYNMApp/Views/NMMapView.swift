//
//  NMapView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/24/24.
//

import SwiftUI
import MapKit


struct NMMapView: View {
    @StateObject private var mapViewModel = MapViewModel()
    @StateObject private var cardListViewModel = CardListViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
            //            .onAppear {
            //                mapViewModel.loadPlaces()
            //                mapViewModel.isShowModal = true
            //            }
            .edgesIgnoringSafeArea(.all)
            
            if mapViewModel.isShowModal {
                //                            Color.black.opacity(0.4)
                //                                .ignoresSafeArea()
                //                                .onTapGesture {
                //                                    withAnimation(.none) {
                //                                        mapViewModel.isShowModal.toggle()
                //                                    }
                //                                }
                
                CarouselView(viewModel: cardListViewModel, mapViewModel: mapViewModel)
                    .transition(.move(edge: .bottom))
                    .animation(mapViewModel.isShowModal ? .none : .default, value: mapViewModel.isShowModal)
            }
        }
        .onAppear {
            mapViewModel.loadPlaces()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.none) {
                    mapViewModel.isShowModal = true
                }
            }
        }
    }
}

#Preview {
    NMMapView()
}
