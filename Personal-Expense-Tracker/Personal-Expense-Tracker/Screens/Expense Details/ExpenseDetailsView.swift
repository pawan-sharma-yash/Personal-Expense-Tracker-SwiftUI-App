//
//  ExpenseDetailsView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI
import ViewModels

struct ExpenseDetailsView: View {
	let expense: ViewModels.Expense

	var body: some View {
		ExpenseView(
			title: expense.title,
			transactionDate: expense.date.description,
			amount: expense.amount,
			category: expense.category
		)
		.navigationTitle("Expense Details")
	}
}
