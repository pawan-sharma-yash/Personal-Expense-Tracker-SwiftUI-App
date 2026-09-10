//
//  File.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 14/05/26.
//

import SwiftUI
import DesignSystem

struct EmptyStateView: View {
	let title: String
	let subtitle: String
	let actionTitle: String
	let action: () -> Void

	var body: some View {
		VStack(spacing: DS.Spacing.xxs) {
			VStack(spacing: DS.Spacing.xxxs) {
				Text(title)
					.font(DS.Typography.headline)
					.foregroundStyle(DS.Color.textPrimary)

				Text(subtitle)
					.font(DS.Typography.caption)
					.foregroundStyle(DS.Color.textSecondary)
			}
			.accessibilityElement(children: .combine)

			Button(actionTitle, action: action)
				.buttonStyle(DS.Components.PrimaryButtonStyle())
				.padding(.top, DS.Spacing.xxs)
				.accessibilityLabel(Text(AccessibilityStrings.Label.emptyStateAction(actionTitle)))
				.accessibilityHint(Text(AccessibilityStrings.Hint.emptyStateAction(actionTitle)))
		}
		.dsCard()
	}
}
