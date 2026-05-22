//
//  TransactionView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 12/05/26.
//

import SwiftUI
import DesignSystem
import ViewModels

struct ExpenseView: View {
	let title: String
	let transactionDate: String
	let amount: Decimal
	let category: ViewModels.ExpenseCategory

	var body: some View {
		HStack(spacing: Spacing.m) {
			// Icon
			ZStack {
				RoundedRectangle(cornerRadius: Radius.s)
					.fill(category.color)
				Image(systemName: category.icon)
					.foregroundColor(Color.black)
					.font(.system(size: 20))
			}
			.frame(width: Control.height, height: Control.height)

			// Title + subtitle
			VStack(alignment: .leading, spacing: Spacing.xxxxs) {
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
	ExpenseView(
		title: "McDonald's",
		transactionDate: "Today, 2:30 PM",
		amount: 200,
		category: .fun
	)
}

private extension ExpenseView {
	typealias Spacing = DS.Metrics.Spacing
	typealias Control = DS.Metrics.Control
	typealias Radius = DS.Metrics.Radius
}
