import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension DS {
	public enum ColorToken {
		// Brand / Accent
		public static let accent = SwiftUI.Color(red: 0.051, green: 0.580, blue: 0.533) // cyan-ish

		// Surfaces
		#if canImport(UIKit)
		public static let background = SwiftUI.Color(uiColor: .systemBackground)
		public static let surface = SwiftUI.Color(uiColor: .secondarySystemBackground)
		public static let elevatedSurface = SwiftUI.Color(uiColor: .tertiarySystemBackground)
		#elseif canImport(AppKit)
		public static let background = SwiftUI.Color(nsColor: .windowBackgroundColor)
		public static let surface = SwiftUI.Color(nsColor: .controlBackgroundColor)
		public static let elevatedSurface = SwiftUI.Color(nsColor: .underPageBackgroundColor)
		#endif

		// Text
		#if canImport(UIKit)
		public static let textPrimary = SwiftUI.Color(uiColor: .label)
		public static let textSecondary = SwiftUI.Color(uiColor: .secondaryLabel)
		#elseif canImport(AppKit)
		public static let textPrimary = SwiftUI.Color(nsColor: .labelColor)
		public static let textSecondary = SwiftUI.Color(nsColor: .secondaryLabelColor)
		#endif

		// Utility
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

