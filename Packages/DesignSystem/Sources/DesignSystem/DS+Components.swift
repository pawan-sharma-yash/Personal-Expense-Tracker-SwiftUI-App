import SwiftUI

extension DS {
	public enum Components { }
}

// MARK: - Card

extension DS.Components {
	public struct Card: ViewModifier {
		let padding: CGFloat

		public init(padding: CGFloat = DS.Metrics.Spacing.m) {
			self.padding = padding
		}

		public func body(content: Content) -> some View {
			content
				.padding(padding)
				.background(DS.ColorToken.surface)
				.clipShape(RoundedRectangle(cornerRadius: DS.Metrics.Radius.m, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.m, style: .continuous)
						.stroke(DS.ColorToken.border.opacity(0.7), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}

public extension View {
	func dsCard(padding: CGFloat = DS.Metrics.Spacing.m) -> some View {
		modifier(DS.Components.Card(padding: padding))
	}
}
