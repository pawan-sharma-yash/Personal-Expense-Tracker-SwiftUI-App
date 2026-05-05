//
//  RecentTransactionsViewModel.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import Observation

@Observable
public final class RecentTransactionsViewModel {
	public var selectedDuration = ExpensePeriod.daily
	public var emptyState: EmtpyState {
		EmtpyState(
			message: "No recent transactions",
			actionTitle: "Add transactions",
			subTitle: "Track every expense to see trends over time."
		)
	}

	// FIXME: Add the real logic for transactions
	public var recentTransactions: [Transaction] = [
//		Transaction(title: "McDonald's", date: .now, amount: -12.50, category: .food),
//		Transaction(title: "Shell Gas Station", date: .now.addingTimeInterval(-60 * 60 * 6), amount: -45.20, category: .transport),
//		Transaction(title: "Salary Deposit", date: .now.addingTimeInterval(-60 * 60 * 24), amount: 3_200, category: .other),
	]

	public init() { }
}
