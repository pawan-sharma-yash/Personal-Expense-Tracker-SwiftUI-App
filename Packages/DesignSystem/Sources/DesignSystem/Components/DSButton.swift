import SwiftUI

extension DS.Components {
	/// Convenience wrapper that applies the design-system button style.
	public struct DSButton: View {
		let title: String
		let style: Style
		let action: () -> Void

		public enum Style: Sendable {
			case primary
			case secondary(tint: SwiftUI.Color)
		}

		public init(_ title: String, style: Style = .primary, action: @escaping () -> Void) {
			self.title = title
			self.style = style
			self.action = action
		}

		public var body: some View {
			switch style {
			case .primary:
				Button(title, action: action)
					.buttonStyle(PrimaryButtonStyle())
					.accessibilityLabel(Text(title))
			case .secondary(let tint):
				Button(title, action: action)
					.buttonStyle(SecondaryButtonStyle(tint: tint))
					.accessibilityLabel(Text(title))
			}
		}
	}
}
