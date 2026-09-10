//
//  ContentView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import ViewModels
import DesignSystem

struct RecentExpensesView: View {
	@State private var recentTransactionsViewModel = RecentExpensesViewModel()
	@Environment(RouterPath.self) private var routerPath

	var body: some View {
		@Bindable var routerPath = routerPath
		NavigationStack(path: $routerPath.path) {
			VStack {
				Picker("Filter period", selection: $recentTransactionsViewModel.selectedDuration) {
					ForEach(ExpensePeriod.allCases) { opt in
						Text(opt.rawValue).tag(opt)
					}
				}
				.pickerStyle(.segmented)
				Spacer(minLength: DS.Spacing.m)
				if recentTransactionsViewModel.recentTransactions.isEmpty {
					EmptyStateView(
						title: recentTransactionsViewModel.emptyState.title,
						subtitle: recentTransactionsViewModel.emptyState.subTitle,
						actionTitle: recentTransactionsViewModel.emptyState.actionTitle,
						action: navigateToAddTrasaction
					)
					Spacer()
				} else {
					RecentExpensesListView(
						recentTransactions: recentTransactionsViewModel.recentTransactions,
						action: navigateToExpenseDetails(_:)
					)
				}
			}
			.padding(DS.Spacing.xs)
			.withAppRouter()
			.navigationTitle(recentTransactionsViewModel.screenTitle)
			.toolbar {
				Button(action: navigateToAddTrasaction) {
					Circle()
						.fill(DS.Color.background)
						.overlay {
							Image(systemName: "plus.circle.fill")
								.font(.title2)
								.fontWeight(.semibold)
								.foregroundStyle(DS.Color.accent)
						}
				}
				.accessibilityLabel(Text(AccessibilityStrings.Label.addTransaction))
				.accessibilityHint(Text(AccessibilityStrings.Hint.addTransaction))
			}
		}
	}
}

private extension RecentExpensesView {
	func navigateToAddTrasaction() {
		routerPath.path.append(.addNewTransaction)
	}

	func navigateToExpenseDetails(_ exp: ViewModels.Expense) {
		routerPath.path.append(.expenseDetails(expense: exp))
	}
}


