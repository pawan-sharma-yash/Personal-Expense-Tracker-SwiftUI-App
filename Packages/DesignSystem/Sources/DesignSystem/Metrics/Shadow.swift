import SwiftUI

extension DS.Metrics {
	/// Shadow / elevation tokens — single source for card / sheet shadows.
	public enum Shadow {
		/// Subtle card shadow (y: 1, blur: 1) using `lightDarkShadow`.
		public static let card = ShadowToken(color: DS.Color.lightDarkShadow, radius: 1, x: 0, y: 1)
		/// Elevated / floating element shadow.
		public static let elevated = ShadowToken(color: SwiftUI.Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
		/// No shadow — useful for flat variants.
		public static let none = ShadowToken(color: .clear, radius: 0, x: 0, y: 0)

		public struct ShadowToken: Sendable {
			public let color: SwiftUI.Color
			public let radius: CGFloat
			public let x: CGFloat
			public let y: CGFloat
		}
	}
}

extension DS {
	public typealias Shadow = Metrics.Shadow
}

public extension View {
	/// Apply a DS shadow token.
	func dsShadow(_ token: DS.Metrics.Shadow.ShadowToken) -> some View {
		shadow(color: token.color, radius: token.radius, x: token.x, y: token.y)
	}
}
