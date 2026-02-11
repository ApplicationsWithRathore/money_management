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
                HStack(alignment: .center) {
                    
                    TopBalanceView(balance: .constant(1),
                                   title: .constant("Total Balance"))
                    Spacer()
                    Divider()
                        .frame(width: 2, height: 40)
                        .background(Color.white)
                        .padding(.horizontal, 20)
                    Spacer()
                    TopBalanceView(balance: .constant(5),
                                   title: .constant("Total Expense"))
                }
                .padding(.horizontal, 24)
                CustomProgressBar(progress: 0.4, totalValue: 4000)
                RoundCardView()
              
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
struct CustomProgressBar: View {
    
    var progress: Double = 0.3   // 30%
    var totalValue: Int = 2000
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            GeometryReader { geo in
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "052224"))
                        .frame(height: 30)
                    HStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .frame(width: geo.size.width * (1 - progress),
                                   height: 30)
                        
                    }
                    HStack {
                        Text("\(Int(progress * 100))%")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Text("\(totalValue)")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "052224"))
                            .bold()
                    }
                    .padding(.horizontal, 10)
                }
            }
            .frame(height: 20)
        }
        .padding()
    }
}



struct TopBalanceView: View {
    @Binding var balance: Double
    @Binding var title: String
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.black)
                Text(title)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: ColorConstant.textColor.rawValue))
                
            }
            Text("\(balance)")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
        }
    }
}
struct RoundCardView: View {

    var listContent: [Int] = [1,2,3,4,5,6,7,8,9,10]

    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hex: "F1FFF3"))
                .ignoresSafeArea()

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
