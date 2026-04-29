//
//  ContentView.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 27/04/26.
//

import SwiftUI
import ViewModels

enum RouterDestination: Hashable {
	case recentTransactions
	case addNewTransaction
}

struct RecentTransactionsView: View {
	@State private var recentTransactionsViewModel = RecentTransactionsViewModel()
	@Environment(RouterPath.self) private var routerPath

	var body: some View {
		// Create an explicit Binding<[RouterDestination]> to avoid parser/generic
		// ambiguity with the NavigationStack trailing closure.
		let pathBinding = Binding<[RouterDestination]>(
			get: { routerPath.path },
			set: { routerPath.path = $0 }
		)

		NavigationStack(path: pathBinding) {
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
					// Mutate the environment router path to navigate
					routerPath.path.append(.addNewTransaction)
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
			.withAppRouter()
			.navigationTitle("ExpenseTracker")
		}
	}
}

#Preview {
	RecentTransactionsView()
}
