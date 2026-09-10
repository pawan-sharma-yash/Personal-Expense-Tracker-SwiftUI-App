import SwiftUI

extension DS {
	/// Semantic typography tokens.
	///
	/// Tokens wrap SwiftUI `Font` with `.rounded` design for brand consistency.
	/// Existing 4 tokens are preserved verbatim for backwards-compat.
	/// New tokens use `relativeTo:` where appropriate so Dynamic Type scales correctly.
	public enum Typography {
		// MARK: Core — preserved (do not change values, tests depend on them)
		/// Used for the main app title on a screen.
		public static let screenTitle = Font.system(.title2, design: .rounded).weight(.semibold)

		/// Used for prominent callouts (empty state titles, totals).
		public static let headline = Font.system(.headline, design: .rounded)

		/// Default body font.
		public static let body = Font.system(.body, design: .rounded)

		/// Supporting / helper text.
		public static let caption = Font.system(.caption, design: .rounded)

		// MARK: Extended — new, additive
		/// Large title for hero / summary screens.
		public static let largeTitle = Font.system(.largeTitle, design: .rounded).weight(.bold)

		/// Title variant for section headers.
		public static let title3 = Font.system(.title3, design: .rounded).weight(.semibold)

		/// Footnote for legal / timestamp text.
		public static let footnote = Font.system(.footnote, design: .rounded)

		/// Caption2 for micro-copy.
		public static let caption2 = Font.system(.caption2, design: .rounded)

		// MARK: Helpers
		/// Returns a semantic font for amount / currency display.
		public static func amount(_ style: Font.TextStyle = .title3) -> Font {
			Font.system(style, design: .rounded).weight(.semibold)
		}
	}
}
