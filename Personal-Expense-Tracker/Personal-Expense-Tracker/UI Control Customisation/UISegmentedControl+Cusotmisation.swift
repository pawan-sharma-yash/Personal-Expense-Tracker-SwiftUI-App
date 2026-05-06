//
//  File.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import UIKit
import DesignSystem
import SwiftUI

extension UISegmentedControl {
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
