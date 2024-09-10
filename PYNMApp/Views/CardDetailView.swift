//
//  CardDetailView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import SwiftUI

struct CardDetailView: View {
    @ObservedObject var viewModel: CardListViewModel
    var card: Card
    @EnvironmentObject var navigationManager: NavigationManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundColor(.white)
                    .clipShape(RoundedCorners(topLeft: 30, topRight: 30))
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack {
                    
                    Image(card.imageName)
                        .resizable()
                        .scaledToFit()
                    //                        .frame(height: 300)
                        .padding()
                    
                    HStack {
                        
                        Text("가게 이름")
                            .font(.pretendBold18)
                        
                        Spacer()
                        
                        Text(card.imageName)
                            .font(.pretendBold18)
                    }
                    
                    Divider()
                    
                    HStack {
                        
                        Text("전화 번호")
                            .font(.pretendBold18)
                        
                        Spacer()
                        
                        Text("000-0000-0000")
                            .font(.pretendBold18)
                    }


                    Divider()
                    
                    HStack {
                        
                        Text("위치")
                            .font(.pretendBold18)
                        
                        Spacer()
                        
                        let address = "서울특별시 중구 창경궁로 62-29"
                        
                        Text(address)
                            .font(.pretendBold18)
                        
                        Button {
                            UIPasteboard.general.string = address
                        } label: {
                            Image(systemName: "doc.on.doc")
                        }

                    }


                    Divider()
                    
                    Spacer()
                    
                    Button("Save") {
                        //                let newImageName = "newSign"
                        //                viewModel.updateCardImage(id: card.id, newImageName: newImageName)
                        viewModel.updateCardOpacity(id: card.id, opacity: 1.0)
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    .buttonStyle(OnboardingButtonStyle())
                    .padding()
                }
                .padding(.horizontal, 30)

            }
            .frame(maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: backButton)
    }
    
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}
