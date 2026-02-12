//
//  ProgressBarView.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 12/02/26.
//
import SwiftUI
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
