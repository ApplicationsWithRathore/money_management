//
//  DashboardView'.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import SwiftUI

struct DashboardView: View {

    @StateObject private var vm: DashboardViewModel

    init(viewModel: DashboardViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 16) {

            VStack {
                Text("Balance")
                Text("₹\(vm.balance, specifier: "%.2f")")
                    .font(.largeTitle)
                    .bold()
            }

            HStack {
                VStack {
                    Text("Income")
                    Text("₹\(vm.totalIncome, specifier: "%.2f")")
                        .foregroundColor(.green)
                }

                Spacer()

                VStack {
                    Text("Expense")
                    Text("₹\(vm.totalExpense, specifier: "%.2f")")
                        .foregroundColor(.red)
                }
            }

            if vm.isEmpty {
                Spacer()
                Text("No transactions yet")
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .padding()
    }
}
