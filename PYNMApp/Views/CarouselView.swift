////
////  CarouselView.swift
////  PYNMApp
////
////  Created by Yujin Son on 9/20/24.
////
//
//import SwiftUI
//
//struct CarouselView: View {
//    @ObservedObject var mapViewModel = MapViewModel()
//    @ObservedObject var cardListViewModel = CardListViewModel()
//
//    var body: some View {
//        VStack {
//            Spacer()
//            
//            Capsule()
//                .frame(width: 40, height: 6)
//                .foregroundColor(.gray)
//                .padding(.top, 8)
//            
//            TabView {
//                ForEach(cardListViewModel.cards) { card in
//                    VStack(spacing: 15) {
//                        Image(card.imageName)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 100, height: 100)
//                        
//                        Text(card.imageName)
//                            .font(.headline)
//                        
//                        Text(card.description)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                            .padding(.horizontal)
//                        
//                        Button("Close") {
//                            mapViewModel.isShowModal = false
//                        }
//                        .padding(.bottom, 20)
//                        
//                        Button {
//                            withAnimation {
//                                mapViewModel.movePlace()
//                            }
//                        } label: {
//                            Text("Teleport")
//                        }
//                        .frame(width: 350)
//                        .buttonStyle(OnboardingButtonStyle())
//                        
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .padding(10)
//                }
//                
//            }
//            .tabViewStyle(PageTabViewStyle())
//            .frame(height: 300)
//        }
//        .frame(maxWidth: .infinity)
//        .background(Color.white)
//        .cornerRadius(20)
//        .shadow(radius: 10)
//        .transition(.move(edge: .bottom))
//        .animation(.easeInOut)
//    }
//}
//
//
//
