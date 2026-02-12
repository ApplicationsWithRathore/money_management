//
//  HomeScreenView.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 11/02/26.
//

import SwiftUI

struct HomeScreenView: View {
   
    var body: some View {
        NavigationView {
            VStack {
                TopBar()
                    .padding(.horizontal, 24)
                TopBalanceCard()
                    .padding(.top, 10)
                .padding(.horizontal, 24)
                CustomProgressBar(progress: 0.4, totalValue: 4000)
                RoundCardView(view: HomeScreenCardView())
              
            }
            .background(
                Color(hex: ColorConstant.mainGreen.rawValue)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
}
struct TopBar: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                
                Text("HI, Welcome Back")
                    .font(.system(size: 22, weight: .bold))
                
                Text("Good Morning")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.black)
            }
            Spacer()
            Button {
                print("Right button tapped")
            } label: {
                Image(systemName: "bell.fill")
                    .foregroundColor(.black)
            }
            .padding(5)
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}






struct HomeScreenCardView: View {
    var listContent: [Int] = [1,2,3,4,5,6,7,8,9,10]
    var body: some View {
        VStack(spacing: 0) {
            CardView()
                .padding(.top, 20)
            List(listContent, id: \.self) { _ in
                TransactionView()
                    .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .scrollIndicators(.never)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
        }
    }
}
struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Daily")
                Spacer()
                Text("Montly")
                Spacer()
                Text("Weekly")
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .background(Color(hex:"DFF7E2"))
            .clipShape(Capsule())
            
        }
        .padding(.horizontal, 24)
    }
}
struct TransactionView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                Image(systemName: "bell.fill")
                    .foregroundColor(.black)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Salary")
                    .font(.system(size: 23, weight: .regular))
                    .bold()
                Text("17/2/2024")
                    .font(.system(size: 18, weight: .semibold))
            }
            Divider()
                .frame(width: 2, height: 40)
                .background(.black)
            Text("Montly")
                .font(.system(size: 15, weight: .bold))
            Divider()
                .frame(width: 2, height: 40)
                .background(.black)
            Text("$4000")
                .font(.system(size: 23, weight: .bold))
        }
        .padding(.horizontal, 24)
    }
}
#Preview {
    HomeScreenView()
}
