import SwiftUI

extension DS {
	enum ColorToken {
		// Brand / Accent
		static let accent = SwiftUI.Color(red: 0.00, green: 0.63, blue: 0.78) // cyan-ish

		// Surfaces
		static let background = SwiftUI.Color(uiColor: .systemBackground)
		static let surface = SwiftUI.Color(uiColor: .secondarySystemBackground)
		static let elevatedSurface = SwiftUI.Color(uiColor: .tertiarySystemBackground)

		// Text
		static let textPrimary = SwiftUI.Color(uiColor: .label)
		static let textSecondary = SwiftUI.Color(uiColor: .secondaryLabel)

		// Utility
		static let border = SwiftUI.Color(uiColor: .separator)
		static let success = SwiftUI.Color(uiColor: .systemGreen)
		static let danger = SwiftUI.Color(uiColor: .systemRed)
	}
}

