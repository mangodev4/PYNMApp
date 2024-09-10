//
//  MainView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = CardListViewModel()
    @StateObject var navigationManager = NavigationManager()
    @State private var offsetY: CGFloat = CGFloat.zero
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minY
                    setOffset(offset: offset)
                    ZStack {
                        //                    Image(systemName: "photo.fill")
                        //                        .font(.title)
                        //                        .foregroundColor(.brown)
                        Image("PYNM_Header")
                            .resizable()
                            .aspectRatio(contentMode: .fill )
                            .clipped()
                        Text("평양냉면 헤더 예시입니다")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    .frame(
                        width: geometry.size.width,
                        height: 250 + (offset > 0 ? offset : 0)
                    )
                    .offset(y: (offset > 0 ? -offset : 0))
                }
                .frame(minHeight: 250)
                
                LazyVStack(pinnedViews:[.sectionHeaders]) {
                    Section(header: Header()) {
                        ForEach(viewModel.cards) { card in
                            ZStack {
                                Button(action: {
                                    navigationManager.navigateToCardDetail(card: card)
                                }) {
                                    Image(card.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(8)
                                        .opacity(card.opacity)
                                }
                                Text(card.imageName)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 150)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            
                        }
                    }
                }
            }
//            .clipped()
            .overlay(
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(offsetY > -250 ? 0 : 1)
                , alignment: .top
            )
//            .navigationTitle("평양냉면")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    VStack {
//                        Text("평양냉면 뿌시기")
//                            .font(.headline)
//                        Image(systemName: "photo.fill")
//                            .font(.title)
//                            .foregroundColor(.brown)
//                            .padding()
//                        Text("뿌셔뿌셔")
//                            .font(.subheadline)
//                    }
//                }
//            }
            .navigationDestination(for: Card.self) { card in
                CardDetailView(viewModel: viewModel, card: card)
                    .environmentObject(navigationManager)
            }
        }
        .environmentObject(navigationManager)
    }
    func setOffset(offset: CGFloat) -> some View {
        DispatchQueue.main.async {
            self.offsetY = offset
        }
        return EmptyView()
    }
}

struct Header: View {
    var body: some View {
        VStack {
            Spacer()
            Text("평양 냉면")
                .fontWeight(.bold)
            Text("서울 맛집 20선")
            Spacer()
            Divider()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 50)
        .background(Rectangle().foregroundColor(.white))
    }
}
