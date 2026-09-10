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
			.padding([.horizontal, .vertical], DS.Spacing.m)
			.background(
				RoundedRectangle(cornerRadius: DS.Radius.m, style: .continuous)
					.fill(DS.Color.surface)
			)
			.dsShadow(DS.Shadow.card)
			.overlay(
				RoundedRectangle(cornerRadius: DS.Radius.m, style: .continuous)
					.stroke(DS.Color.border.opacity(0.7), lineWidth: DS.BorderWidth.hairline)
			)
		}
		.listStyle(.plain)
	}
}

private extension RecentExpensesListView {
	var listInsets: EdgeInsets {
		EdgeInsets(
			top: DS.Spacing.xs,
			leading: 0,
			bottom: DS.Spacing.xs,
			trailing: 0
		)
	}
}
