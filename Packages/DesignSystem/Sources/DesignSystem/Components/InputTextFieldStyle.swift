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
				.padding(.horizontal, DS.Metrics.Spacing.`8`)
				.frame(minHeight: DS.Metrics.Control.height)
				.background(Color.elevatedSurface)
				.clipShape(RoundedRectangle(cornerRadius: DS.Metrics.Radius.`10`, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.`10`, style: .continuous)
						.stroke(Color.border.opacity(0.8), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}

