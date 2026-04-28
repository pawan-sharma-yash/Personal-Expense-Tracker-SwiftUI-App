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
				Button(recentTransactionsViewModel.emptyState.actionTitle) {
					print("Add transaction clicked")
				}
				.frame(height: 40)
				.padding([.leading, .trailing], 12)
				.overlay(
					RoundedRectangle(cornerRadius: 8)
						.stroke(Color.green, lineWidth: 2)  // border color & width
				)
				.padding([.top], 12)
				Spacer()
			}
			.padding()
		}
	}
}

#Preview {
	RecentTransactionsView()
}
