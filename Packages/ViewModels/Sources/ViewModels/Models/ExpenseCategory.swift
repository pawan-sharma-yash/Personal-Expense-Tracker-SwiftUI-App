public enum ExpenseCategory: String, CaseIterable, Identifiable, Sendable {
	case food = "Food"
	case transport = "Transport"
	case shopping = "Shopping"
	case home = "Home"
	case fun = "Fun"
	case health = "Health"
	case education = "Education"
	case other = "Other"

	public var id: String { self.rawValue }
	public var title: String { self.rawValue }
}

