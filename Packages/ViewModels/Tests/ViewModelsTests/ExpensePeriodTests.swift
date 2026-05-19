import Testing
@testable import ViewModels

@Suite("ExpensePeriod")
struct ExpensePeriodTests {
	@Test func `all cases are stable`() {
		#expect(ExpensePeriod.allCases == [.day, .week, .month])
	}

	@Test func `raw values are user facing labels`() {
		#expect(ExpensePeriod.day.rawValue == "Daily")
		#expect(ExpensePeriod.week.rawValue == "Weekly")
		#expect(ExpensePeriod.month.rawValue == "Monthly")
	}

	@Test func `id equals raw value`() {
		for period in ExpensePeriod.allCases {
			#expect(period.id == period.rawValue)
		}
	}
}

