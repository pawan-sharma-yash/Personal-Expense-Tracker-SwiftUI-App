import Testing
@testable import ViewModels

@Suite("ExpenseCategory")
struct ExpenseCategoryTests {
	@Test func `allCases ordering is stable`() {
		#expect(ExpenseCategory.allCases == [
			.food, .transport, .shopping, .fun, .health, .education
		])
	}

	@Test func `title and icon is non-empty`() {
		for category in ExpenseCategory.allCases {
			#expect(category.title.isEmpty == false)
			#expect(category.icon.isEmpty == false)
		}
	}
}

