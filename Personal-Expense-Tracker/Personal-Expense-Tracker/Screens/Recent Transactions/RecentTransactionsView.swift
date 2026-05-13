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
				Spacer(minLength: 12.0)
				if recentTransactionsViewModel.recentTransactions.isEmpty {
					VStack(spacing: DS.Metrics.Spacing.`6`) {
						Text(recentTransactionsViewModel.emptyState.message)
							.font(DS.Typography.headline)
							.foregroundStyle(DS.ColorToken.textPrimary)

						Text(recentTransactionsViewModel.emptyState.subTitle)
							.font(DS.Typography.caption)
							.foregroundStyle(DS.ColorToken.textSecondary)

						Button(recentTransactionsViewModel.emptyState.actionTitle) {
							navigateToAddTrasaction()
						}
						.buttonStyle(DS.Components.PrimaryButtonStyle())
						.padding(.top, DS.Metrics.Spacing.`6`)
					}
					.dsCard()
					Spacer()
				} else {
					List(recentTransactionsViewModel.recentTransactions) { tx in
						Button(action: navigateToExpenseDetails) {
							TransactionView(
								title: tx.title,
								transactionDate: tx.date.description,
								amount: tx.amount,
								category: tx.category
							)
						}
						.listRowSeparator(.hidden)
						.listRowInsets(listInsets)
						.padding(.vertical, DS.Metrics.Spacing.`12`)
						.padding(.horizontal, DS.Metrics.Spacing.`12`)
						.background(
							RoundedRectangle(cornerRadius: 12)
								.fill(Color(red: 249 / 255, green: 250 / 255, blue: 252 / 255))
								.shadow(color: Color.black.opacity(0.03), radius: 1, x: 0, y: 1)
						)
						.overlay(
							RoundedRectangle(cornerRadius: 12)
								.stroke(Color(.systemGray5), lineWidth: 1)
						)
					}
					.listStyle(.plain)
				}
			}
			.padding(DS.Metrics.Spacing.`8`)
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
	var listInsets: EdgeInsets {
		EdgeInsets(
			top: DS.Metrics.Spacing.`8`,
			leading: 0,
			bottom: DS.Metrics.Spacing.`8`,
			trailing: 0
		)
	}

	func navigateToAddTrasaction() {
		routerPath.path.append(.addNewTransaction)
	}

	func navigateToExpenseDetails() {
		routerPath.path.append(.expenseDetails)
	}
}
