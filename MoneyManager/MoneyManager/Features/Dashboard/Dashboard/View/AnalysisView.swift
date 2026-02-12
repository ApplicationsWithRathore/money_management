//
//  AnalysisView.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 12/02/26.
//
import SwiftUI
import Charts

// MARK: - Data Models
struct FinancePoint: Identifiable {
    let id = UUID()
    let day: String
    let type: String   // "Income" or "Expense"
    let value: Double
}
struct DayData: Identifiable {
    let id = UUID()
    let day: String
    let income: Double
    let expense: Double
}

// MARK: - Tab Bar
struct AnalysisTabBar: View {
    let tabs = ["Daily","Weekly","Monthly","Yearly"]
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { item in
                Text(item)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color(hex: "DFF7E2"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(.top, 10)
    }
}

// MARK: - Chart Header
struct ChartHeaderView: View {
    var body: some View {
        HStack {
            Text("Income & Expense")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            Spacer()
            Button(action: {
                print("Calendar tapped")
            }) {
                Image(systemName: "calendar")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color.white.opacity(0.6))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Chart View
struct IncomeExpenseChartView: View {
    let daysData: [DayData]
    var chartData: [FinancePoint] {
        daysData.flatMap { day in
            [
                FinancePoint(day: day.day, type: "Income", value: day.income),
                FinancePoint(day: day.day, type: "Expense", value: day.expense)
            ]
        }
    }
    var body: some View {
        Chart {
            ForEach(chartData) { point in
                BarMark(
                    x: .value("Day", point.day),
                    y: .value("Amount", point.value)
                )
                .foregroundStyle(by: .value("Type", point.type))
                .cornerRadius(10)
                .position(by: .value("Type", point.type))
            }
        }
        .chartForegroundStyleScale([
            "Income": Color.green.opacity(0.6),
            "Expense": Color.blue
        ])
        .chartYAxis {
            AxisMarks(position: .leading) { value in
                AxisGridLine(stroke: StrokeStyle(dash: [4]))
                    .foregroundStyle(Color.blue.opacity(0.4))
                AxisValueLabel() {
                    if let number = value.as(Double.self) {
                        Text("\(Int(number/1000))k")
                            .foregroundColor(.blue.opacity(0.7))
                    }
                }
            }
        }
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel()
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.black.opacity(0.8))
            }
        }
        .frame(height: 190)
        .padding()
    }
}

struct AnalysisView: View {
    var body: some View {
        NavigationView {
            VStack {
                TopBalanceCard()
                    .padding(.top, 10)
                    .padding(.horizontal, 24)
                CustomProgressBar(progress: 0.4, totalValue: 4000)
                RoundCardView(view: BottomCardView())
            }
            .background(
                Color(hex: ColorConstant.mainGreen.rawValue)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        
    }
}

struct BottomCardView: View {
    let daysData: [DayData] = [
        DayData(day: "Mon", income: 4000, expense: 2000),
        DayData(day: "Tue", income: 3500, expense: 1800),
        DayData(day: "Wed", income: 4200, expense: 2100),
        DayData(day: "Thu", income: 3900, expense: 1700),
        DayData(day: "Fri", income: 4500, expense: 2200),
        DayData(day: "Sat", income: 7800, expense: 2500),
        DayData(day: "Sun", income: 4300, expense: 2000)
    ]
    var body: some View {
        VStack {
            AnalysisTabBar()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(hex: "DFF7E2"))
                VStack(spacing: 20) {
                    ChartHeaderView()
                    IncomeExpenseChartView(daysData: daysData)
                }
            }
            .frame(height: 220)
            .padding(.top, 20)
            Spacer()
        }
    }
}

#Preview {
    AnalysisView()
}
