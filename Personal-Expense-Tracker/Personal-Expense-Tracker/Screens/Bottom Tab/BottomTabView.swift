//
//  BottomTabView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

struct BottomTabView: View {
	var body: some View {
		TabView {
			RecentTransactionsView()
				.tabItem {
					Label("Home", systemImage: "house.fill")
				}

			ExpenseAnalyticsView()
				.tabItem {
					Label("Analytics", systemImage: "chart.line.uptrend.xyaxis")
				}

			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape.fill")
				}
		}
	}
}

#Preview {
	BottomTabView()
}
