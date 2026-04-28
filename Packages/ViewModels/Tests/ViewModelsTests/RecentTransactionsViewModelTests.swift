import Testing
@testable import ViewModels

@Suite("Recent Tranctions View Model Tests")
struct RecentTranctionsViewModel {
	private let vm = RecentTransactionsViewModel()

	@Test func `start with daily transation`() async throws {
		#expect(vm.selectedDuration == .daily)
	}
}
