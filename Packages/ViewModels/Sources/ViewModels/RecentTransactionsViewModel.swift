//
//  RecentTransactionsViewModel.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import Observation

public enum ExpensePeriod: String, CaseIterable, Identifiable {
	case daily = "Daily"
	case weekly = "Weekly"
	case monthly = "Monthly"
	public var id: String { rawValue }
}

@Observable
public final class RecentTransactionsViewModel {
	public var selection = ExpensePeriod.daily

	public init() { }
}
