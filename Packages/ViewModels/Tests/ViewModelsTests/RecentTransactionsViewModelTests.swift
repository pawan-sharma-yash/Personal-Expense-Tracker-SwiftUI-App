import Testing
@testable import ViewModels

@Suite("Recent Tranctions View Model Tests")
struct RecentTranctionsViewModel {
	private let vm = RecentTransactionsViewModel()

	@Test func `starts with daily transations`() {
		#expect(vm.selectedDuration == .daily)
	}

	@Test() func `shows correct empty state messages`() {
		#expect(vm.emptyState.message == "No recent transactions")
		#expect(vm.emptyState.actionTitle == "Add transactions")
		#expect(vm.emptyState.subTitle == "Track every expense to see trends over time.")
	}

	@Test func `selected duration can be changed`() {
		vm.selectedDuration = .monthly
		#expect(vm.selectedDuration == .monthly)
	}

	@Test func `empty state is always populated`() {
		let state = vm.emptyState
		#expect(state.message.isEmpty == false)
		#expect(state.actionTitle.isEmpty == false)
		#expect(state.subTitle.isEmpty == false)
	}
}
