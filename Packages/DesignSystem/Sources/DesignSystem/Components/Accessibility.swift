import SwiftUI
import Foundation

// Reusable accessibility helpers for common UI patterns
public extension View {
	/// Makes the view an accessibility element that describes a transaction row.
	///
	/// - Parameters:
	///   - title: Transaction title (e.g. merchant)
	///   - category: Category title (e.g. Food)
	///   - amount: Decimal amount
	///   - currencyCode: ISO currency code, defaults to current locale's currency or "USD"
	///   - transactionDate: Date description to include in label
	func accessibilityTransaction(title: String,
																category: String,
																amount: Decimal,
																currencyCode: String? = nil,
																transactionDate: String) -> some View {
		// Prepare currency string using NumberFormatter for best accessibility/readability
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		if let code = currencyCode {
			formatter.currencyCode = code
		} else if let localeCurrency = Locale.current.currency?.identifier {
			formatter.currencyCode = localeCurrency
		}

		let amountString = formatter.string(from: NSDecimalNumber(decimal: amount)) ?? "\(amount)"

		let label = AccessibilityStrings.Label.transaction(title: title, category: category, amount: amountString, date: transactionDate)

		return self
			.accessibilityElement(children: .combine)
			.accessibilityLabel(Text(label))
	}
}
