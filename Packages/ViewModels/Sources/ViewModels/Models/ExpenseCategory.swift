public enum ExpenseCategory: String, CaseIterable, Identifiable, Sendable {
	case food
	case transport
	case shopping
	case home
	case fun
	case health
	case education
	case other

	public var id: String { rawValue }

	public var title: String {
		switch self {
		case .food: "Food"
		case .transport: "Transport"
		case .shopping: "Shopping"
		case .home: "Home"
		case .fun: "Fun"
		case .health: "Health"
		case .education: "Education"
		case .other: "Other"
		}
	}
}

