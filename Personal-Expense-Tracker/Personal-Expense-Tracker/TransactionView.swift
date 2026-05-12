//
//  TransactionView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 12/05/26.
//

import SwiftUI

struct TransactionView: View {
	let title: String
	let transactionDate: String

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
			Text(String(format: "-$%.2f", abs(400)))
				.font(.headline)
				.foregroundColor(.red)
		}
	}
}
