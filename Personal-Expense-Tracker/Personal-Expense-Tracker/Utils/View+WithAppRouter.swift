//
//  withAppRouter.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 29/04/26.
//

import SwiftUI

extension View {
	func withAppRouter() -> some View {
		navigationDestination(for: RouterDestination.self) { screen in
			switch screen {
			case .recentTransactions: RecentTransactionsView()
			case .addNewTransaction: AddNewExpenseView()
			case .expenseDetails: ExpenseDetailsView()
			}
		}
	}
}
