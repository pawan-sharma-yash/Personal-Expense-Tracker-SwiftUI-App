//
//  RecentTransactionsViewModel.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import Observation

enum ExpensePeriod: String, CaseIterable, Identifiable {
	case daily = "Daily"
	case weekly = "Weekly"
	case monthly = "Monthly"
	var id: String { rawValue }
}

@Observable
final class RecentTransactionsViewModel {
	var selection = ExpensePeriod.daily
}
