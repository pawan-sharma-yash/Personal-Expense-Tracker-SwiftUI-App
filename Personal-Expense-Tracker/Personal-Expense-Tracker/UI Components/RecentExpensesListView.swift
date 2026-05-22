//
//  File.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 20/05/26.
//

import SwiftUI
import ViewModels
import DesignSystem

struct RecentExpensesListView: View {
	let recentTransactions: [ViewModels.Expense]
	let action: (ViewModels.Expense) -> Void

	var body: some View {
		List(recentTransactions) { tx in
			Button(action: { action(tx) }) {
				ExpenseView(
					title: tx.title,
					transactionDate: tx.date.description,
					amount: tx.amount,
					category: tx.category
				)
			}
			.listRowSeparator(.hidden)
			.listRowInsets(listInsets)
			.padding([.horizontal, .vertical], Spacing.m)
			.background(
				RoundedRectangle(cornerRadius: Radius.m)
					.fill(Color.veryLightBackground)
					.shadow(color: Color.lightDarkShadow, radius: 1, x: 0, y: 1)
			)
			.overlay(
				RoundedRectangle(cornerRadius: Radius.m)
					.stroke(Color(.systemGray5), lineWidth: BorderWidth.hairline)
			)
		}
		.listStyle(.plain)
	}
}

private extension RecentExpensesListView {
	var listInsets: EdgeInsets {
		EdgeInsets(
			top: Spacing.xs,
			leading: 0,
			bottom: Spacing.xs,
			trailing: 0
		)
	}
}

private extension RecentExpensesListView {
	typealias Spacing = DS.Metrics.Spacing
	typealias Radius = DS.Metrics.Radius
	typealias BorderWidth = DS.Metrics.BorderWidth
}
