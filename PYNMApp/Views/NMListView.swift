//
//  NMListView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/12/24.
//

import SwiftUI

struct NMListView: View {
    @ObservedObject var viewModel = CardListViewModel()
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
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
            .background(Color.clear)
            .overlay(
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.all)
                , alignment: .top
            )
            .edgesIgnoringSafeArea(.bottom)
            .navigationDestination(for: Card.self) { card in
                CardDetailView(viewModel: viewModel, card: card)
                    .environmentObject(navigationManager)
            }
        }        
        .environmentObject(navigationManager)
    }

    // MARK: Sticky Header
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
}



#Preview {
    NMListView()
}
