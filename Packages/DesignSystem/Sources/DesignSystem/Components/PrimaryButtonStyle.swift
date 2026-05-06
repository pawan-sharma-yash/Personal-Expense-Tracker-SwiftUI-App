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

		public func makeBody(configuration: Configuration) -> some View {
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(.white)
				.frame(maxWidth: .infinity, minHeight: DS.Metrics.Control.height)
				.padding(.horizontal, DS.Metrics.Spacing.m)
				.background(DS.ColorToken.accent)
				.clipShape(RoundedRectangle(cornerRadius: DS.Metrics.Radius.s, style: .continuous))
				.opacity(configuration.isPressed ? 0.85 : 1.0)
		}
	}
}
