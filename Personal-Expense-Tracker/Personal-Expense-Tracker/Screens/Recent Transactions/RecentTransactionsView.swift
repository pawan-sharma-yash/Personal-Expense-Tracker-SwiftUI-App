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
	private typealias Spacing = DS.Metrics.Spacing

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
					VStack(spacing: Spacing.`6`) {
						Text(recentTransactionsViewModel.emptyState.message)
							.font(DS.Typography.headline)
							.foregroundStyle(Color.textPrimary)

						Text(recentTransactionsViewModel.emptyState.subTitle)
							.font(DS.Typography.caption)
							.foregroundStyle(Color.textSecondary)

						Button(
							recentTransactionsViewModel.emptyState.actionTitle,
							action: navigateToAddTrasaction
						)
						.buttonStyle(DS.Components.PrimaryButtonStyle())
						.padding(.top, Spacing.`6`)
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
						.padding(.vertical, Spacing.`12`)
						.padding(.horizontal, Spacing.`12`)
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
			.padding(Spacing.`8`)
			.withAppRouter()
			.navigationTitle("Expense Tracker")
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

private extension RecentTransactionsView {
	var listInsets: EdgeInsets {
		EdgeInsets(
			top: Spacing.`8`,
			leading: 0,
			bottom: Spacing.`8`,
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
