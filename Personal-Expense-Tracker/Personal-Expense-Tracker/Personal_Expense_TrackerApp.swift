//
//  Personal_Expense_TrackerApp.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import UIKit
import Observation
import DesignSystem

fileprivate extension UISegmentedControl {
	static func _customAppearance() {
		// Customize the segmented control appearance
		UISegmentedControl.appearance().backgroundColor = UIColor(DS.ColorToken.surface)
		UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(DS.ColorToken.accent)

		// Set font for normal state
		UISegmentedControl.appearance()
			.setTitleTextAttributes([
				.foregroundColor: UIColor.darkGray,
				.font: UIFont.systemFont(ofSize: 15, weight: .semibold)
			], for: .normal)

		// Set font for selected state
		UISegmentedControl.appearance()
			.setTitleTextAttributes([
				.foregroundColor: UIColor.white,
				.font: UIFont.systemFont(ofSize: 15, weight: .bold)
			], for: .selected)
	}
}

@main
struct Personal_Expense_TrackerApp: App {
	init() {
		UISegmentedControl._customAppearance()
	}

	var body: some Scene {
		WindowGroup {
			RecentTransactionsView()
				.environment(RouterPath())
		}
	}
}
