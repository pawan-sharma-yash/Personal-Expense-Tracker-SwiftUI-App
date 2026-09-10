//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

extension DS.Components {
	/// Primary CTA button — accent background, white foreground.
	///
	/// Handles `isPressed` and `isEnabled` (via `\.isEnabled` environment).
	public struct PrimaryButtonStyle: ButtonStyle {
		@Environment(\.isEnabled) private var isEnabled

		public init() { }

		public func makeBody(configuration: Configuration) -> some View {
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(.white)
				.frame(maxWidth: .infinity, minHeight: DS.Control.height)
				.padding(.horizontal, DS.Spacing.xs)
				.background(isEnabled ? DS.Color.accent : DS.Color.border.opacity(0.6))
				.clipShape(RoundedRectangle(cornerRadius: DS.Radius.button, style: .continuous))
				.opacity(configuration.isPressed && isEnabled ? 0.85 : 1.0)
				.animation(.easeOut(duration: 0.12), value: configuration.isPressed)
		}
	}
}
