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

		public func makeBody(configuration: Configuration) -> some View {
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(tint)
				.frame(maxWidth: .infinity, minHeight: DS.Metrics.Control.height)
				.padding(.horizontal, DS.Metrics.Spacing.`8`)
				.background(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.`10`, style: .continuous)
						.fill(tint.opacity(configuration.isPressed ? 0.10 : 0.06))
				)
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.`10`, style: .continuous)
						.stroke(tint.opacity(0.55), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}
