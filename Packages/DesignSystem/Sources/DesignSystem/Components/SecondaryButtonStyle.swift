//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//


import SwiftUI

extension DS.Components {
	public struct SecondaryButtonStyle: ButtonStyle {
		let tint: SwiftUI.Color

		public init(tint: SwiftUI.Color = .accent) {
			self.tint = tint
		}

		private typealias Spacing = DS.Metrics.Spacing
		private typealias Radius = DS.Metrics.Radius
		private typealias Control = DS.Metrics.Control
		private typealias BorderWidth = DS.Metrics.BorderWidth

		public func makeBody(configuration: Configuration) -> some View {
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(tint)
				.frame(maxWidth: .infinity, minHeight: Control.height)
				.padding(.horizontal, Spacing.xs)
				.background(
					RoundedRectangle(cornerRadius: Radius.s, style: .continuous)
						.fill(tint.opacity(configuration.isPressed ? 0.10 : 0.06))
				)
				.overlay(
					RoundedRectangle(cornerRadius: Radius.s, style: .continuous)
						.stroke(tint.opacity(0.55), lineWidth: BorderWidth.hairline)
				)
		}
	}
}
