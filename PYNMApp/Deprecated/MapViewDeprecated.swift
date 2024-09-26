////
////  MapView.swift
////  PYNMApp
////
////  Created by Yujin Son on 9/11/24.
////
//
//import SwiftUI
//import MapKit
//
//struct MapView: View {
//    
//    @StateObject private var viewModel = MapViewModel(cardListViewModel: CardListViewModel())
//    @State private var isShowModal = true
////    @State private var modalHeight: PresentationDetent = .height(170)
//    @StateObject private var bottomSheetManager = BottomSheetHeightManager()
//    
//    var body: some View {
//        ZStack {
//            Map(
//                coordinateRegion: $viewModel.region,
//                annotationItems: viewModel.places
//            ) { place in
//                MapAnnotation(
//                    coordinate: place.coordinate
//                ) {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 5)
//                            .fill(Color.white.opacity(0.8))
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(Color.secondary, lineWidth: 2)
//                        VStack {
//                            Image(systemName: "building.fill")
//                                .foregroundColor(.blue)
//                                .padding(5)
//                            Text(place.name)
//                                .font(.caption)
//                                .padding(5)
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                viewModel.loadPlaces()
//            }
//            .edgesIgnoringSafeArea(.all)
//            
//            VStack {
//                Header()
//                    .frame(height: 60)
//                
//                Spacer()
//
//                Button {
//                    bottomSheetManager.changeHeight(to: .expanded)
//                } label: {
//                    Text("View List")
//                }
//                .frame(width: 100)
//                .buttonStyle(OnboardingButtonStyle())
//                .padding(.bottom, 180)
////                .transition(.move(edge: .top))
////                .offset(y: buttonOffset())
////                .animation(.easeInOut, value: bottomSheetManager.changeHeight(to: .expanded))
//            }
//            .overlay(
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
//                    .edgesIgnoringSafeArea(.all)
//                , alignment: .top
//            )
//        }
//        .sheet(isPresented: $isShowModal) {
//            NMListView()
//                .presentationDetents([.height(170), .height(700)], selection: Binding(
//                                    get: { bottomSheetManager.currentHeight.presentationDetent },
//                                    set: { _ in }
//                                ))
//                .presentationBackground(.clear)
//                .presentationBackgroundInteraction(
//                    .enabled(upThrough: .height(700)))
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled(true)
//        }
//    }
//    
////    private func buttonOffset() -> CGFloat {
////        if case .expanded = bottomSheetManager.currentHeight {
////            return -700
////        } else {
////            return -170
////        }
////    }
//    
//    // MARK: Sticky Header
//    struct Header: View {
//        var body: some View {
//            VStack {
//                Spacer()
//                Image(systemName: "photo.fill")
//                    .font(.largeTitle)
//                Spacer()
//                Divider()
//            }
//            .frame(minWidth: 0, maxWidth: .infinity)
//            .frame(height: 60)
//            .background(Rectangle().foregroundColor(.white))
//        }
//    }
//}
//
