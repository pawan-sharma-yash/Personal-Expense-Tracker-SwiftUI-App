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

	public init() { }

	public var screenTitle: String { "Expense Tracker" }

	public var recentTransactions: [Expense] { [
		Expense(
			title: "McDonald's",
			date: .now,
			amount: -12.50,
			category: .food
		),
		Expense(
			title: "Shell Gas Station",
			date: .now.addingTimeInterval(-60 * 60 * 6),
			amount: -45.20,
			category: .transport
		),
		Expense(
			title: "Salary Deposit",
			date: .now.addingTimeInterval(-60 * 60 * 24),
			amount: 3_200,
			category: .fun
		),
		Expense(
			title: "McDonald's",
			date: .now,
			amount: -12.50,
			category: .food
		),
		Expense(
			title: "Shell Gas Station",
			date: .now.addingTimeInterval(-60 * 60 * 6),
			amount: -45.20,
			category: .transport
		),
		Expense(
			title: "Salary Deposit",
			date: .now.addingTimeInterval(-60 * 60 * 24),
			amount: 3_200,
			category: .fun
		),
		Expense(
			title: "McDonald's",
			date: .now,
			amount: -12.50,
			category: .food
		),
		Expense(
			title: "Shell Gas Station",
			date: .now.addingTimeInterval(-60 * 60 * 6),
			amount: -45.20,
			category: .transport
		),
		Expense(
			title: "Salary Deposit",
			date: .now.addingTimeInterval(-60 * 60 * 24),
			amount: 3_200,
			category: .health
		),
	]}
}
