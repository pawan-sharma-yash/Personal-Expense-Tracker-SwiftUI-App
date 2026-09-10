//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

extension DS.Components {
	/// Secondary / ghost button — tinted foreground, subtle fill and hairline stroke.
	public struct SecondaryButtonStyle: ButtonStyle {
		let tint: SwiftUI.Color
		@Environment(\.isEnabled) private var isEnabled

		public init(tint: SwiftUI.Color = DS.Color.accent) {
			self.tint = tint
		}

		public func makeBody(configuration: Configuration) -> some View {
			let effectiveTint = isEnabled ? tint : DS.Color.border
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(effectiveTint)
				.frame(maxWidth: .infinity, minHeight: DS.Control.height)
				.padding(.horizontal, DS.Spacing.xs)
				.background(
					RoundedRectangle(cornerRadius: DS.Radius.button, style: .continuous)
						.fill(effectiveTint.opacity(configuration.isPressed ? 0.10 : 0.06))
				)
				.overlay(
					RoundedRectangle(cornerRadius: DS.Radius.button, style: .continuous)
						.stroke(effectiveTint.opacity(isEnabled ? 0.55 : 0.35), lineWidth: DS.BorderWidth.hairline)
				)
				.opacity(isEnabled ? 1 : 0.6)
				.animation(.easeOut(duration: 0.12), value: configuration.isPressed)
		}
	}
}
