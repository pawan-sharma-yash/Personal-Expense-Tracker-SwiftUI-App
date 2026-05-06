//
//  InputTextFieldStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

// MARK: - Inputs

extension DS.Components {
	public struct InputTextFieldStyle: SwiftUI.TextFieldStyle {
		public init() { }

		public func _body(configuration: TextField<_Label>) -> some View {
			configuration
				.font(DS.Typography.body)
				.padding(.horizontal, DS.Metrics.Spacing.m)
				.frame(minHeight: DS.Metrics.Control.height)
				.background(DS.ColorToken.elevatedSurface)
				.clipShape(RoundedRectangle(cornerRadius: DS.Metrics.Radius.s, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.s, style: .continuous)
						.stroke(DS.ColorToken.border.opacity(0.8), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}

