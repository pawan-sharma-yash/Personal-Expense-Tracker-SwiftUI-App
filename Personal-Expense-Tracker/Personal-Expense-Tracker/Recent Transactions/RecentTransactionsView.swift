//
//  ContentView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import ViewModels

struct RecentTransactionsView: View {
	@State private var viewModel = RecentTransactionsViewModel()

	var body: some View {
		NavigationStack {
			ScrollView {
				VStack {
					Picker("Options", selection: $viewModel.selectedDuration) {
						ForEach(ExpensePeriod.allCases) { opt in
							Text(opt.rawValue).tag(opt)
						}
					}
					.pickerStyle(.segmented)
					
					// Use selection
					Text("Selected: \(viewModel.selectedDuration.rawValue)")
						.font(.headline)
				}
			}
		}
	}
}

#Preview {
	RecentTransactionsView()
}
