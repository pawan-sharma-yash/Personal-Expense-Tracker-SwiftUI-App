//
//  InputTextFieldStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

// MARK: - TypeAlias

private extension DS.Components {
	typealias Spacing = DS.Metrics.Spacing
	typealias Radius = DS.Metrics.Radius
	typealias Control = DS.Metrics.Control
	typealias BorderWidth = DS.Metrics.BorderWidth
}

// MARK: - Inputs

extension DS.Components {
	public struct InputTextFieldStyle: SwiftUI.TextFieldStyle {
		public init() { }

		public func _body(configuration: TextField<_Label>) -> some View {
			configuration
				.font(DS.Typography.body)
				.padding(.horizontal, Spacing.xs)
				.frame(minHeight: Control.height)
				.background(Color.elevatedSurface)
				.clipShape(RoundedRectangle(cornerRadius: Radius.s, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: Radius.s, style: .continuous)
						.stroke(Color.border.opacity(0.8), lineWidth: BorderWidth.hairline)
				)
		}
	}
}

