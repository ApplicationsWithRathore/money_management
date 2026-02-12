//
//  BottomSheetCardView.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 12/02/26.
//

import SwiftUI
struct RoundCardView: View {
    var view:  any View
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hex: "F1FFF3"))
                .ignoresSafeArea()
            AnyView(view)
                .padding(.horizontal, 24)
        }
    }
}
