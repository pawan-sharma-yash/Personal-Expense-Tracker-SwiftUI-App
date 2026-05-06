//
//  SettingsView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
			NavigationStack {
				VStack {
					Text("Hello, World!")
				}
					.navigationTitle("Settings")
					.navigationBarTitleDisplayMode(.inline)
			}
    }
}

#Preview {
    SettingsView()
}
