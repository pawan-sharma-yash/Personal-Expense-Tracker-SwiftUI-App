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

				VStack(spacing: DS.Metrics.Spacing.s) {
					Text(recentTransactionsViewModel.emptyState.message)
						.font(DS.Typography.headline)
						.foregroundStyle(DS.ColorToken.textPrimary)

					Text(recentTransactionsViewModel.emptyState.subTitle)
						.font(DS.Typography.caption)
						.foregroundStyle(DS.ColorToken.textSecondary)

					Button(recentTransactionsViewModel.emptyState.actionTitle) {
						// Mutate the environment router path to navigate
						navigateToAddTrasaction()
					}
					.buttonStyle(DS.Components.PrimaryButtonStyle())
					.padding(.top, DS.Metrics.Spacing.s)
				}
				.dsCard()
				Spacer()
			}
			.padding(DS.Metrics.Spacing.m)
			.withAppRouter()
			.navigationTitle("Expense Tracker")
			.toolbar {
				Button {
					navigateToAddTrasaction()
				} label: {
					Circle()
						.fill(Color.white)
						.overlay {
							Image(systemName: "plus.circle.fill")
								.font(.title2)
								.fontWeight(.semibold)
								.foregroundColor(DS.ColorToken.accent)
						}
				}
			}
		}
	}
}

private extension RecentTransactionsView {
	func navigateToAddTrasaction() {
		routerPath.path.append(.addNewTransaction)
	}
}

#Preview {
	RecentTransactionsView()
}
