//
//  TransactionView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 12/05/26.
//

import SwiftUI
import DesignSystem

struct TransactionView: View {
	let title: String
	let transactionDate: String
	let amount: Decimal

	var body: some View {
		HStack(spacing: 12) {
			// Icon
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.fill(Color.orange)
				Image(systemName: "fork.knife")
					.foregroundColor(Color.black)
					.font(.system(size: 18))
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
			}
			.layoutPriority(1)

			Spacer()

			// Amount
			Text(amount.formatted(.currency(code: "USD")))
				.font(.headline)
				.foregroundColor(.red)
		}
	}
}

#Preview {
	TransactionView(
		title: "McDonald's",
		transactionDate: "Today, 2:30 PM",
		amount: 200
	)
}
