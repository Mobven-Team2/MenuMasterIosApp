//
//  HomeView.swift
//  MenuMasterIosApp
//
//  Created by Ediz Aydogan on 24.05.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    
    
    var body: some View {
        NavigationViewStack {
            VStack {
                
                ZStack {
                    Image(getImageName())
                        .resizable()
                        .scaledToFit()
                    
                    helloUser
//                    pickMeal

                }
                .edgesIgnoringSafeArea(.top)
                
                
//                Spacer()
                VStack{
                    pickMeal
                }
                .offset(y: -140)
                
                Spacer()
            }
            
            
        }

    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private func getImageName() -> String {
        return viewModel.determineTime()
    }
    
    private var helloUser : some View {
        HStack {
            Image("user-avatar")
                .padding(.leading, 27)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Merhaba, hoşgeldin")
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.body)
                    .fontWeight(.light)
                Text("Jane Doe")
                    .foregroundStyle(Color.theme.primaryTextColor)
                    .font(.body)
                    .fontWeight(.bold)
            }
            Spacer()
            
            Image("bell")
                .frame(width: 42, height: 42)
                .background(Color.theme.bellColor)
                .cornerRadius(24)
                .padding(.trailing, 27)
        }
    }
    
    private var pickMeal : some View {
        ZStack {
            Image("top-card")
            
            VStack(alignment: .leading) {
                Text("Öğün Seç & Tarifleri Al")
                    .font(.poppins(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 285, height: 24, alignment: .leading)
                    .lineLimit(1)
                    .padding(.leading, 4)
                Text("Tarif almak istediğin öğünleri seç, yapay zekanın sana özel hazırladığı tariflere göz at")
                    .font(.poppins(size: 14))
                    .frame(width: 285, height: 63)
                    .lineLimit(3)
                Button(action: {
                    
                }) {
                    Text("Öğün Seç")
                }
                .font(.poppins(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 96, height: 56)
                .background(Color.theme.primaryOrangeColor)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
            .padding(.top, 80)
            
            
            
        }
//        .offset(y: -140)

    }
    
}
