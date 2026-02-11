//
//  DashboardView'.swift
//  MoneyManager
//
//  Created by Jitendra Rathore on 31/12/25.
//

import SwiftUI
enum DashboardTab: Hashable {
    case home
    case analysis
    case transaction
    case profile
}
struct DashboardView: View {
    @State var selection: DashboardTab = .home
    
    init() {
    }
    
    var body: some View {
        TabView(selection: $selection) {Tab("", systemImage: "house.fill", value: .home ) {
        }
            
        Tab("", systemImage: "chart.bar.fill", value: .analysis) {
            }
            Tab("", systemImage: "tray.and.arrow.up.fill", value: .transaction) {
            }
            Tab("", systemImage: "person.crop.circle.fill", value: .profile) {
            }
        }
    }
}
#Preview {
    DashboardView()
}
