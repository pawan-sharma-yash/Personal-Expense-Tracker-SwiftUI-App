import Testing
@testable import ViewModels

@Suite("AddExpenseViewModel")
struct AddExpenseViewModelTests {
	@Test func `defaults are sensible`() {
		let vm = AddExpenseViewModel()
		#expect(vm.amountText == "")
		#expect(vm.selectedCategory == .food)
		#expect(vm.noteText == "")
		#expect(vm.canSave == false)
	}

	@Test func `canSave requires valid amount`() {
		let vm = AddExpenseViewModel()
		vm.amountText = ""
		#expect(vm.canSave == false)

		vm.amountText = "0"
		#expect(vm.canSave == false)

		vm.amountText = "0.00"
		#expect(vm.canSave == false)

		vm.amountText = "12.50"
		#expect(vm.canSave == true)
	}

	@Test func `parsedAmount returns nil for invalid input`() {
		let vm = AddExpenseViewModel()
		vm.amountText = "abc"
		#expect(vm.parsedAmount == nil)

		vm.amountText = "12..2"
		#expect(vm.parsedAmount == nil)
	}

	@Test func `parsedAmount normalizes comma decimals`() {
		let vm = AddExpenseViewModel()
		vm.amountText = "12,50"
		#expect(vm.parsedAmount == 12.50)
	}
}

