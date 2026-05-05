//
//  ContentView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import ViewModels
import DesignSystem


struct RecentTransactionsView: View {
	@State private var recentTransactionsViewModel = RecentTransactionsViewModel()
	@Environment(RouterPath.self) private var routerPath

	var body: some View {
		@Bindable var routerPath = routerPath
		NavigationStack(path: $routerPath.path) {
			VStack {
				Picker("Options", selection: $recentTransactionsViewModel.selectedDuration) {
					ForEach(ExpensePeriod.allCases) { opt in
						Text(opt.rawValue).tag(opt)
					}
				}
				.pickerStyle(.segmented)

				Spacer()

				if recentTransactionsViewModel.recentTransactions.isEmpty {
					VStack(spacing: DS.Metrics.Spacing.s) {
						Text(recentTransactionsViewModel.emptyState.message)
							.font(DS.Typography.headline)
							.foregroundStyle(DS.ColorToken.textPrimary)

						Text(recentTransactionsViewModel.emptyState.subTitle)
							.font(DS.Typography.caption)
							.foregroundStyle(DS.ColorToken.textSecondary)

						Button(recentTransactionsViewModel.emptyState.actionTitle) {
							// Mutate the environment router path to navigate
							routerPath.path.append(.addNewTransaction)
						}
						.buttonStyle(DS.Components.PrimaryButtonStyle())
						.padding(.top, DS.Metrics.Spacing.s)
					}
					.dsCard()
				} else {
					Text("Render the transactions")
				}
				Spacer()
			}
			.padding(DS.Metrics.Spacing.m)
			.withAppRouter()
			.navigationTitle("ExpenseTracker")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

#Preview {
	RecentTransactionsView()
}
