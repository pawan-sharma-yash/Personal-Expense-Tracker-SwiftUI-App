import SwiftUI

extension DS {
	enum Typography {
		/// Used for the main app title on a screen.
		static let screenTitle = Font.system(.title2, design: .rounded).weight(.semibold)

		/// Used for prominent callouts (empty state titles, totals).
		static let headline = Font.system(.headline, design: .rounded)

		/// Default body font.
		static let body = Font.system(.body, design: .rounded)

		/// Supporting / helper text.
		static let caption = Font.system(.caption, design: .rounded)
	}
}

