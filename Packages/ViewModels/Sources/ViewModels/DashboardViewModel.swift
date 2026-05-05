import Foundation
import Observation

@Observable
public final class DashboardViewModel {
	public var selectedPeriod = ExpensePeriod.daily

	// Placeholder values until persistence is added.
	public var totalBalance: Decimal = 12_847.50
	public var income: Decimal = 15_240
	public var expenses: Decimal = 2_392.50

	public var recentTransactions: [Transaction] = [
		Transaction(title: "McDonald's", date: .now, amount: -12.50, category: .food),
		Transaction(title: "Shell Gas Station", date: .now.addingTimeInterval(-60 * 60 * 6), amount: -45.20, category: .transport),
		Transaction(title: "Salary Deposit", date: .now.addingTimeInterval(-60 * 60 * 24), amount: 3_200, category: .other),
	]

	public init() { }

	public func formatCurrency(_ value: Decimal) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.currencySymbol = "$"
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 2
		return formatter.string(from: value as NSDecimalNumber) ?? "$0.00"
	}
}

