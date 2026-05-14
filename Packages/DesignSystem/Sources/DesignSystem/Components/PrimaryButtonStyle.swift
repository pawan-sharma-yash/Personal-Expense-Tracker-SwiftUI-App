//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

extension DS.Components {
	public struct PrimaryButtonStyle: ButtonStyle {
		public init() { }

		private typealias Spacing = DS.Metrics.Spacing
		private typealias Radius = DS.Metrics.Radius
		private typealias Control = DS.Metrics.Control

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
