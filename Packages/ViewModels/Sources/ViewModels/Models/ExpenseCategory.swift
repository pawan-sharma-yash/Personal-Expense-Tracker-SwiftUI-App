import SwiftUI

public enum ExpenseCategory: String, CaseIterable, Identifiable, Sendable {
	case food = "Food"
	case transport = "Transport"
	case shopping = "Shopping"
	case fun = "Fun"
	case health = "Health"
	case education = "Education"

	public var id: String { self.rawValue }
	public var title: String { self.rawValue }
	public var icon: String {
		switch self {
		case .food: "fork.knife.circle"
		case .transport: "car.fill"
		case .shopping: "bag.circle.fill"
		case .fun: "figure.outdoor.rowing.circle.fill"
		case .health: "heart.fill"
		case .education: "graduationcap.circle.fill"
		}
	}

	public var color: Color {
		switch self {
		case .food: .orange
		case .transport: .orange
		case .shopping: .orange
		case .fun: .orange
		case .health: .orange
		case .education: .orange
		}
	}
}

