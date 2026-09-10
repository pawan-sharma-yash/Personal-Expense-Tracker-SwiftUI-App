//
//  Card.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

// MARK: - Card

extension DS.Components {
	/// Card container — applies surface background, rounded corners, hairline border and padding.
	///
	/// This is the canonical card. Avoid re-implementing `RoundedRectangle + stroke + shadow`
	/// inline; use `dsCard()` so border radius, surface and shadow stay in sync.
	public struct Card: ViewModifier {
		let padding: CGFloat
		let radius: CGFloat
		let showBorder: Bool
		let showShadow: Bool

		public init(
			padding: CGFloat = DS.Spacing.xs,
			radius: CGFloat = DS.Radius.card,
			showBorder: Bool = true,
			showShadow: Bool = false
		) {
			self.padding = padding
			self.radius = radius
			self.showBorder = showBorder
			self.showShadow = showShadow
		}

		public func body(content: Content) -> some View {
			content
				.padding(padding)
				.background(DS.Color.surface)
				.clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
				.overlay {
					if showBorder {
						RoundedRectangle(cornerRadius: radius, style: .continuous)
							.stroke(DS.Color.border.opacity(0.7), lineWidth: DS.BorderWidth.hairline)
					}
				}
				.shadow(
					color: showShadow ? DS.Color.lightDarkShadow : .clear,
					radius: showShadow ? 1 : 0, x: 0, y: showShadow ? 1 : 0
				)
		}
	}
}

public extension View {
	/// Apply the design-system card style.
	func dsCard(
		padding: CGFloat = DS.Spacing.xs,
		radius: CGFloat = DS.Radius.card,
		showBorder: Bool = true,
		showShadow: Bool = false
	) -> some View {
		modifier(DS.Components.Card(padding: padding, radius: radius, showBorder: showBorder, showShadow: showShadow))
	}

	/// Card-style background without inner padding — useful for `List` rows.
	func dsCardBackground(
		radius: CGFloat = DS.Radius.card,
		showBorder: Bool = true,
		showShadow: Bool = true
	) -> some View {
		modifier(DS.Components.Card(padding: 0, radius: radius, showBorder: showBorder, showShadow: showShadow))
	}
}
