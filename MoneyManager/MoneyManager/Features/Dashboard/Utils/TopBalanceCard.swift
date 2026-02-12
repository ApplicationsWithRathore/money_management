//
//  TopBalanceCard.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 12/02/26.
//

import SwiftUI
struct TopBalanceCard: View {
    var body: some View{
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
    }
}
fileprivate struct TopBalanceView: View {
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
