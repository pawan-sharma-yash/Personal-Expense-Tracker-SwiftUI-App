//
//  TransactionView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 12/05/26.
//

import SwiftUI
import DesignSystem
import ViewModels

struct TransactionView: View {
	let title: String
	let transactionDate: String
	let amount: Decimal
	let category: ViewModels.ExpenseCategory

	var body: some View {
		HStack(spacing: 12) {
			// Icon
			ZStack {
				RoundedRectangle(cornerRadius: DS.Metrics.Radius.s)
					.fill(category.color)
				Image(systemName: category.icon)
					.foregroundColor(Color.black)
					.font(.system(size: 20))
			}
			.frame(width: 44, height: 44)

			// Title + subtitle
			VStack(alignment: .leading, spacing: 2) {
				Text(title)
					.font(.headline)
					.foregroundColor(.primary)

				Text(transactionDate)
					.font(.subheadline)
					.foregroundColor(.secondary)
					.lineLimit(1)
			}

			Spacer()

			// Amount
			Text(amount.formatted(.currency(code: "INR")))
				.font(.headline)
				.foregroundColor(.red)
		}
	}
}

#Preview {
	TransactionView(
		title: "McDonald's",
		transactionDate: "Today, 2:30 PM",
		amount: 200,
		category: .fun
	)
}
