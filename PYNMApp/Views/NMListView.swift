//
//  NMListView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/12/24.
//

import SwiftUI

struct NMListView: View {
    @ObservedObject var cardListViewModel = CardListViewModel()
    @StateObject var mapViewModel = MapViewModel()
    //    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .top){
            VStack {
                HeaderSection()
                ScrollView {
                    LazyVStack {
                        ForEach(cardListViewModel.cards) { card in
                            VStack {
                                Image(card.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(8)
                                    .opacity(card.opacity)
                                Text(card.imageName)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                        .background(Color.clear)
                    }
                }
                HStack(alignment: .top) {
                    Spacer()
                }
                .padding(.top, 10)
            }
        }
    }
}

// MARK: Header Section
struct HeaderSection: View {
    var body: some View {
        Spacer()

        VStack {
            Spacer()
//            Text("평양 냉면")
//                .fontWeight(.bold)
//            Text("서울 맛집 20선")
//            Spacer()
//            Divider()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 50)
        .background(Rectangle().foregroundColor(.white))
    }
}

#Preview {
    NMListView()
}
