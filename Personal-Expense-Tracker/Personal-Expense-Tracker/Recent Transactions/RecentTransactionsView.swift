//
//  ContentView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import ViewModels

struct RecentTransactionsView: View {
	@State private var recentTransactionsViewModel = RecentTransactionsViewModel()

	var body: some View {
		NavigationStack {
			VStack {
				Picker("Options", selection: $recentTransactionsViewModel.selectedDuration) {
					ForEach(ExpensePeriod.allCases) { opt in
						Text(opt.rawValue).tag(opt)
					}
				}
				.pickerStyle(.segmented)
				Spacer()
				Text(recentTransactionsViewModel.emptyState.message)
					.padding([.bottom], 12)
				Button(recentTransactionsViewModel.emptyState.actionTitle) {
					print("ha ha ha")
				}
				Spacer()
			}
			.padding()
		}
	}
}

#Preview {
	RecentTransactionsView()
}
