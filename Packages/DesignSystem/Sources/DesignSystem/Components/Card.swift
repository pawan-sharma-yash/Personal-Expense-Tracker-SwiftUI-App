//
//  Card.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

// MARK: - Card

private extension DS.Components {
	typealias Spacing = DS.Metrics.Spacing
	typealias Radius = DS.Metrics.Radius
	typealias Control = DS.Metrics.Control
	typealias BorderWidth = DS.Metrics.BorderWidth
}

extension DS.Components {
	public struct Card: ViewModifier {
		let padding: CGFloat

		public init(padding: CGFloat = DS.Metrics.Spacing.xs) {
			self.padding = padding
		}

		public func body(content: Content) -> some View {
			content
				.padding(padding)
				.background(Color.surface)
				.clipShape(RoundedRectangle(cornerRadius: Radius.m, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: Radius.m, style: .continuous)
						.stroke(Color.border.opacity(0.7), lineWidth: BorderWidth.hairline)
				)
		}
	}
}

public extension View {
	func dsCard(padding: CGFloat = DS.Metrics.Spacing.xs) -> some View {
		modifier(DS.Components.Card(padding: padding))
	}
}
