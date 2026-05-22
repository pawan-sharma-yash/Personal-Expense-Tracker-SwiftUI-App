import Testing
@testable import ViewModels

@MainActor @Suite("Recent Tranctions View Model Tests")
struct RecentTranctionsViewModel {
	private let vm = RecentExpensesViewModel()

	@Test func `starts with daily transations`() {
		#expect(vm.selectedDuration == .day)
	}

	@Test func `sets correct screen title`() {
		#expect(vm.screenTitle == "Expense Tracker")
	}

	@Test() func `shows correct empty state messages`() {
		#expect(vm.emptyState.title == "No recent transactions")
		#expect(vm.emptyState.actionTitle == "Add transactions")
		#expect(vm.emptyState.subTitle == "Track every expense to see trends over time.")
	}

	@Test func `selected duration can be changed`() {
		vm.selectedDuration = .month
		#expect(vm.selectedDuration == .month)
	}

	@Test func `empty state is always populated`() {
		let state = vm.emptyState
		#expect(state.title.isEmpty == false)
		#expect(state.actionTitle.isEmpty == false)
		#expect(state.subTitle.isEmpty == false)
	}
}
