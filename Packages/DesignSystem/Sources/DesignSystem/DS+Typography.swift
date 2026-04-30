import SwiftUI

extension DS {
	public enum Typography {
		/// Used for the main app title on a screen.
		public static let screenTitle = Font.system(.title2, design: .rounded).weight(.semibold)

		/// Used for prominent callouts (empty state titles, totals).
		public static let headline = Font.system(.headline, design: .rounded)

		/// Default body font.
		public static let body = Font.system(.body, design: .rounded)

		/// Supporting / helper text.
		public static let caption = Font.system(.caption, design: .rounded)
	}
}

