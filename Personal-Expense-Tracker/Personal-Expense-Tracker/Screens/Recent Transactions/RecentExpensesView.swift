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
				Spacer(minLength: Spacing.m)
				if recentTransactionsViewModel.recentTransactions.isEmpty {
					EmptyStateView(
						title: recentTransactionsViewModel.emptyState.title,
						subtitle: recentTransactionsViewModel.emptyState.subTitle,
						actionTitle: recentTransactionsViewModel.emptyState.actionTitle,
						action: navigateToAddTrasaction
					)
					Spacer()
				} else {
					List(recentTransactionsViewModel.recentTransactions) { tx in
						Button(action: { navigateToExpenseDetails(tx) }) {
							ExpenseView(
								title: tx.title,
								transactionDate: tx.date.description,
								amount: tx.amount,
								category: tx.category
							)
						}
						.listRowSeparator(.hidden)
						.listRowInsets(listInsets)
						.padding([.horizontal, .vertical], Spacing.m)
						.background(
							RoundedRectangle(cornerRadius: Radius.m)
								.fill(Color.veryLightBackground)
								.shadow(color: Color.lightDarkShadow, radius: 1, x: 0, y: 1)
						)
						.overlay(
							RoundedRectangle(cornerRadius: Radius.m)
								.stroke(Color(.systemGray5), lineWidth: BorderWidth.hairline)
						)
					}
					.listStyle(.plain)
				}
			}
			.padding(Spacing.xs)
			.withAppRouter()
			.navigationTitle(recentTransactionsViewModel.screenTitle)
			.toolbar {
				Button(action: navigateToAddTrasaction) {
					Circle()
						.fill(Color.white)
						.overlay {
							Image(systemName: "plus.circle.fill")
								.font(.title2)
								.fontWeight(.semibold)
								.foregroundColor(Color.accent)
						}
				}
			}
		}
	}
}

private extension RecentExpensesView {
	var listInsets: EdgeInsets {
		EdgeInsets(
			top: Spacing.xs,
			leading: 0,
			bottom: Spacing.xs,
			trailing: 0
		)
	}

	func navigateToAddTrasaction() {
		routerPath.path.append(.addNewTransaction)
	}

	func navigateToExpenseDetails(_ exp: ViewModels.Expense) {
		routerPath.path.append(.expenseDetails(expense: exp))
	}
}

private extension RecentExpensesView {
	typealias Spacing = DS.Metrics.Spacing
	typealias Radius = DS.Metrics.Radius
	typealias BorderWidth = DS.Metrics.BorderWidth
}
