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
		HStack(spacing: DS.Spacing.m) {
			// Icon
			ZStack {
				RoundedRectangle(cornerRadius: DS.Radius.s)
					.fill(category.color)
				Image(systemName: category.icon)
					.foregroundStyle(.white)
					.font(.system(size: 20))
			}
			.frame(width: DS.Control.height, height: DS.Control.height)
			.accessibilityHidden(true)

			// Title + subtitle
			VStack(alignment: .leading, spacing: DS.Spacing.xxxxs) {
				Text(title)
					.font(DS.Typography.headline)
					.foregroundStyle(DS.Color.textPrimary)

				Text(transactionDate)
					.font(DS.Typography.caption)
					.foregroundStyle(DS.Color.textSecondary)
					.lineLimit(1)
			}

			Spacer()

			// Amount
			Text(amount.formatted(.currency(code: "INR")))
				.font(DS.Typography.headline)
				.foregroundStyle(DS.Color.danger)
		}
		.accessibilityTransaction(
			title: title,
			category: category.title,
			amount: amount,
			currencyCode: "INR",
			transactionDate: transactionDate
		)
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


