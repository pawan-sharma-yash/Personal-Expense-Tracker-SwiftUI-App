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
}
