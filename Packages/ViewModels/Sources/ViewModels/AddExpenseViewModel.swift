import Foundation
import Observation

@Observable
public final class AddExpenseViewModel {
	public var amountText: String = ""
	public var selectedCategory: ExpenseCategory = .food
	public var noteText: String = ""
	public var date: Date = .now

	public init() { }

	public var parsedAmount: Decimal? {
		let trimmed = amountText.trimmingCharacters(in: .whitespacesAndNewlines)
		if trimmed.isEmpty { return nil }

		// Accept comma decimals from some keyboards/locales (e.g. "12,50")
		// but reject malformed inputs like "12..2".
		let normalized = trimmed.replacingOccurrences(of: ",", with: ".")

		// Strict validation: digits, optional single decimal point, up to 2 decimals.
		// Examples: "12", "12.", "12.5", "12.50"
		// Rejected: "..", "12..2", "12.5.0", "abc"
		let pattern = #"^\d+(\.\d{0,2})?$"#
		guard normalized.range(of: pattern, options: .regularExpression) != nil else { return nil }

		// Decimal(string:) is strict; "12..2" => nil, which is what we want.
		guard let decimal = Decimal(string: normalized) else { return nil }
		if decimal <= 0 { return nil }
		return decimal
	}

	public var canSave: Bool {
		parsedAmount != nil
	}
}

