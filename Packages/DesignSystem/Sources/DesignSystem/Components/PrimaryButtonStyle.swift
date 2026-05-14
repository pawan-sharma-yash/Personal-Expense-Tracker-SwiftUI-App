//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

private extension DS.Components {
	typealias Spacing = DS.Metrics.Spacing
	typealias Radius = DS.Metrics.Radius
	typealias Control = DS.Metrics.Control
	typealias BorderWidth = DS.Metrics.BorderWidth
}

extension DS.Components {
	public struct PrimaryButtonStyle: ButtonStyle {
		public init() { }

		public func makeBody(configuration: Configuration) -> some View {
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(.white)
				.frame(maxWidth: .infinity, minHeight: Control.height)
				.padding(.horizontal, Spacing.xs)
				.background(Color.accent)
				.clipShape(RoundedRectangle(cornerRadius: Radius.s, style: .continuous))
				.opacity(configuration.isPressed ? 0.85 : 1.0)
		}
	}
}
