import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// MARK: - Namespaced Source of Truth

extension DS {
	/// Semantic color tokens.
	///
	/// `DS.Color` is the **single source of truth**.  The `Color.xxx` extensions
	/// below are lightweight bridges for backwards-compatibility and ergonomics
	/// (`Color.accent` still works).
	public enum Color {
		// MARK: Brand / Accent
		/// Primary brand color — used for CTAs, selection, links.
		public static let accent = SwiftUI.Color(red: 0.051, green: 0.580, blue: 0.533)

		/// Very light background for grouped lists / cards on light mode.
		public static let veryLightBackground = SwiftUI.Color(red: 249 / 255, green: 250 / 255, blue: 252 / 255)

		/// Subtle shadow color for card elevation (3% black).
		public static let lightDarkShadow = SwiftUI.Color.black.opacity(0.03)

		// MARK: Surfaces — semantic, adaptive via system colors
		#if canImport(UIKit)
		public static let background = SwiftUI.Color(uiColor: .systemBackground)
		public static let surface = SwiftUI.Color(uiColor: .secondarySystemBackground)
		public static let elevatedSurface = SwiftUI.Color(uiColor: .tertiarySystemBackground)
		#elseif canImport(AppKit)
		public static let background = SwiftUI.Color(nsColor: .windowBackgroundColor)
		public static let surface = SwiftUI.Color(nsColor: .controlBackgroundColor)
		public static let elevatedSurface = SwiftUI.Color(nsColor: .underPageBackgroundColor)
		#endif

		// MARK: Text
		#if canImport(UIKit)
		public static let textPrimary = SwiftUI.Color(uiColor: .label)
		public static let textSecondary = SwiftUI.Color(uiColor: .secondaryLabel)
		#elseif canImport(AppKit)
		public static let textPrimary = SwiftUI.Color(nsColor: .labelColor)
		public static let textSecondary = SwiftUI.Color(nsColor: .secondaryLabelColor)
		#endif

		// MARK: Utility / Feedback
		#if canImport(UIKit)
		public static let border = SwiftUI.Color(uiColor: .separator)
		public static let success = SwiftUI.Color(uiColor: .systemGreen)
		public static let danger = SwiftUI.Color(uiColor: .systemRed)
		#elseif canImport(AppKit)
		public static let border = SwiftUI.Color(nsColor: .separatorColor)
		public static let success = SwiftUI.Color(nsColor: .systemGreen)
		public static let danger = SwiftUI.Color(nsColor: .systemRed)
		#endif
	}
}

// MARK: - Backwards-compat bridge on SwiftUI.Color

extension SwiftUI.Color {
	// Brand / Accent — forwarded to DS.Color
	public static let accent = DS.Color.accent
	public static let veryLightBackground = DS.Color.veryLightBackground
	public static let lightDarkShadow = DS.Color.lightDarkShadow

	// Surfaces
	public static let background = DS.Color.background
	public static let surface = DS.Color.surface
	public static let elevatedSurface = DS.Color.elevatedSurface

	// Text
	public static let textPrimary = DS.Color.textPrimary
	public static let textSecondary = DS.Color.textSecondary

	// Utility
	public static let border = DS.Color.border
	public static let success = DS.Color.success
	public static let danger = DS.Color.danger
}
