import Testing
@testable import ViewModels

@Suite("ExpensePeriod")
struct ExpensePeriodTests {
	@Test func `all cases are stable`() {
		#expect(ExpensePeriod.allCases == [.daily, .weekly, .monthly])
	}

	@Test func `raw values are user facing labels`() {
		#expect(ExpensePeriod.daily.rawValue == "Daily")
		#expect(ExpensePeriod.weekly.rawValue == "Weekly")
		#expect(ExpensePeriod.monthly.rawValue == "Monthly")
	}

	@Test func `id equals raw value`() {
		for period in ExpensePeriod.allCases {
			#expect(period.id == period.rawValue)
		}
	}
}

