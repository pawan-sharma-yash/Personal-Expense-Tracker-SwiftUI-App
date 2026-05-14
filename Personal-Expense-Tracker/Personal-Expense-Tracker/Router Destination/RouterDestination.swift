//
//  RouterDestination.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import ViewModels

enum RouterDestination: Hashable {
	case recentTransactions
	case addNewTransaction
	case expenseDetails(expense: ViewModels.Expense)
}
