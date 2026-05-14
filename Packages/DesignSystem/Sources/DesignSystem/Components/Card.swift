//
//  Card.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

// MARK: - Card

extension DS.Components {
	public struct Card: ViewModifier {
		let padding: CGFloat

		public init(padding: CGFloat = DS.Metrics.Spacing.`8`) {
			self.padding = padding
		}

		public func body(content: Content) -> some View {
			content
				.padding(padding)
				.background(Color.surface)
				.clipShape(RoundedRectangle(cornerRadius: DS.Metrics.Radius.`14`, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.`14`, style: .continuous)
						.stroke(Color.border.opacity(0.7), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}

public extension View {
	func dsCard(padding: CGFloat = DS.Metrics.Spacing.`8`) -> some View {
		modifier(DS.Components.Card(padding: padding))
	}
}
