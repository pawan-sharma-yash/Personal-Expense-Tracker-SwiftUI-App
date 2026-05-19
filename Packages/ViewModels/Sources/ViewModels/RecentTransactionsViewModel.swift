//
//  RecentTransactionsViewModel.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import Observation

@Observable @MainActor
public final class RecentTransactionsViewModel {
	private let dataSource: ExpensesDataSourceProtocol = MockExpensesProvider()
	public var selectedDuration = ExpensePeriod.day
	public var recentTransactions = [Expense]()

	public var emptyState: EmtpyState {
		EmtpyState(
			title: "No recent transactions",
			actionTitle: "Add transactions",
			subTitle: "Track every expense to see trends over time."
		)
	}

	public init() {
		Task {
			await loadTransactions()
		}
	}

	public var screenTitle: String { "Expense Tracker" }
}

// MARK: - Private

private extension RecentTransactionsViewModel {
	/// Fetches and updates transactions for the currently selected duration.
	/// Extracted so it can be re-called on duration changes.

	func loadTransactions() async {
		do {
			recentTransactions = try await dataSource.fetchExpenses(for: selectedDuration)
		} catch {
			recentTransactions = []
		}
	}
}
