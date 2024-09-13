//
//  MapView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State private var isShowSheet = true
//    @State private var region: MKCoordinateRegion
//    @State private var currentIndex = 0
    
//    init() {
//        _region = State(
//            initialValue: MKCoordinateRegion(
//                center: CLLocationCoordinate2D(
//                    latitude: 37.503774633134,
//                    longitude: 127.048192060882
//                ),
//                span: MKCoordinateSpan(
//                    latitudeDelta: 0.01,
//                    longitudeDelta: 0.01
//                )
//            )
//        )
//    }
    
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $viewModel.region,
                annotationItems: viewModel.places
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
                viewModel.loadPlaces()
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Header()
                    .frame(height: 60)
                
                Spacer()
                
            }
            .overlay(
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.all)
                , alignment: .top
            )
        }
        .sheet(isPresented: $isShowSheet) {
            TeleportSheet(viewModel: viewModel)
                .presentationDetents([.fraction(0.2)])
        }
    }
    
    // MARK: Sticky Header
    struct Header: View {
        var body: some View {
            VStack {
                Spacer()
                Image(systemName: "photo.fill")
                    .font(.largeTitle)
//                Text("서울 맛집 20선")
                Spacer()
                Divider()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 60)
            .background(Rectangle().foregroundColor(.white))
        }
    }
    
    struct TeleportSheet: View {
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
}

