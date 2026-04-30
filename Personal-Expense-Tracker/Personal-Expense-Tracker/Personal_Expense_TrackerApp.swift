//
//  Personal_Expense_TrackerApp.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import UIKit
import Observation

fileprivate extension UISegmentedControl {
	static func _customAppearance() {
		// Customize the segmented control appearance
		UISegmentedControl.appearance().backgroundColor = .systemGray6
		UISegmentedControl.appearance().selectedSegmentTintColor = .systemCyan

		// Set font for normal state
		UISegmentedControl.appearance()
			.setTitleTextAttributes([
				.foregroundColor: UIColor.darkGray,
				.font: UIFont.systemFont(ofSize: 16, weight: .medium)
			],
															for: .normal
			)

		// Set font for selected state
		UISegmentedControl.appearance()
			.setTitleTextAttributes([
				.foregroundColor: UIColor.white,
				.font: UIFont.systemFont(ofSize: 16, weight: .bold)
			],
															for: .selected
			)
	}
}

enum RouterDestination: Hashable {
	case recentTransactions
	case addNewTransaction
}

@Observable @MainActor
final class RouterPath {
	var path: [RouterDestination] = []
}

@main
struct Personal_Expense_TrackerApp: App {
	init() {
		UISegmentedControl._customAppearance()
	}

	var body: some Scene {
		WindowGroup {
			RecentTransactionsView()
		}
		.environment(RouterPath())
	}
}
