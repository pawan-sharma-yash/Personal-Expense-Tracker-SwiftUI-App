//
//  Personal_Expense_TrackerApp.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import UIKit
import DesignSystem

@main
struct Personal_Expense_TrackerApp: App {
	init() {
		UISegmentedControl._customAppearance()
	}

	var body: some Scene {
		WindowGroup {
			BottomTabView()
				.environment(RouterPath())
		}
	}
}
