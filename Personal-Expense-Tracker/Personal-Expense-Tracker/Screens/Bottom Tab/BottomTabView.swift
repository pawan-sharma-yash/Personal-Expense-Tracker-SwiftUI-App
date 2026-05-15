//
//  BottomTabView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI
import ViewModels

struct BottomTabView: View {
	private let vm = BottomTabbarViewModel()

	var body: some View {
		TabView {
			recentExpenses()
			analytics()
			settings()
		}
	}
}

private extension BottomTabView {
	 func recentExpenses() -> some View {
		RecentExpensesView()
			.tabItem {
				Label(vm.home.title, systemImage: vm.home.icon)
			}
	}
	
	func analytics() -> some View {
		ExpenseAnalyticsView()
			.tabItem {
				Label(vm.analytics.title, systemImage: vm.analytics.icon)
			}
	}
	
	func settings() -> some View {
		SettingsView()
			.tabItem {
				Label(vm.settings.title, systemImage: vm.settings.icon)
			}
	}
}

#Preview {
	BottomTabView()
}
