import Foundation

public struct Transaction: Identifiable, Equatable, Sendable {
	public let id: UUID
	public let title: String
	public let date: Date
	public let amount: Decimal
	public let category: ExpenseCategory

	public init(
		id: UUID = UUID(),
		title: String,
		date: Date,
		amount: Decimal,
		category: ExpenseCategory
	) {
		self.id = id
		self.title = title
		self.date = date
		self.amount = amount
		self.category = category
	}
}

