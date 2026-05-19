//
//  File.swift
//  ViewModels
//
//  Created by Pawan Kumar Sharma on 19/05/26.
//

import Observation
import Foundation

public protocol ExpensesDataSourceProtocol: Sendable {
	func fetchExpenses(for period: ExpensePeriod) async throws -> [Expense]
}

@Observable @MainActor
final class MockExpensesProvider: ExpensesDataSourceProtocol {
	public func fetchExpenses(for period: ExpensePeriod) async throws -> [Expense] {
		[
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
			)
		]
	}
}
