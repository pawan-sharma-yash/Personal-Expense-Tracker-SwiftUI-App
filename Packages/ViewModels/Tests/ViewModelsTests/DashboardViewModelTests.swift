import Testing
@testable import ViewModels

@Suite("DashboardViewModel")
struct DashboardViewModelTests {
	@Test func `formatCurrency uses two decimals`() {
		let vm = DashboardViewModel()
		#expect(vm.formatCurrency(12847.5) == "$12,847.50")
		#expect(vm.formatCurrency(12) == "$12.00")
	}

	@Test func `summary cards default data is stable`() {
		let vm = DashboardViewModel()
		#expect(vm.totalBalance > 0)
		#expect(vm.income >= 0)
		#expect(vm.expenses >= 0)
		#expect(vm.recentTransactions.count > 0)
	}
}

