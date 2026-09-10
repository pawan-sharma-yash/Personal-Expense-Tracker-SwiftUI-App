//
//  InputTextFieldStyle.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

// MARK: - Inputs

extension DS.Components {
	/// Text field style — elevated surface, border, consistent height.
	///
	/// Use `TextField(...).textFieldStyle(DS.Components.InputTextFieldStyle())`
	public struct InputTextFieldStyle: SwiftUI.TextFieldStyle {
		public init() { }

		public func _body(configuration: TextField<_Label>) -> some View {
			configuration
				.font(DS.Typography.body)
				.padding(.horizontal, DS.Spacing.xs)
				.frame(minHeight: DS.Control.height)
				.background(DS.Color.elevatedSurface)
				.clipShape(RoundedRectangle(cornerRadius: DS.Radius.button, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: DS.Radius.button, style: .continuous)
						.stroke(DS.Color.border.opacity(0.8), lineWidth: DS.BorderWidth.hairline)
				)
		}
	}
}

