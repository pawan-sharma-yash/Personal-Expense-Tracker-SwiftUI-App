import SwiftUI

extension DS {
	enum Components { }
}

// MARK: - Card

extension DS.Components {
	struct Card: ViewModifier {
		let padding: CGFloat

		init(padding: CGFloat = DS.Metrics.Spacing.m) {
			self.padding = padding
		}

		func body(content: Content) -> some View {
			content
				.padding(padding)
				.background(DS.ColorToken.surface)
				.clipShape(RoundedRectangle(cornerRadius: DS.Metrics.Radius.m, style: .continuous))
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.m, style: .continuous)
						.stroke(DS.ColorToken.border.opacity(0.7), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}

extension View {
	func dsCard(padding: CGFloat = DS.Metrics.Spacing.m) -> some View {
		modifier(DS.Components.Card(padding: padding))
	}
}

// MARK: - Buttons

extension DS.Components {
	struct PrimaryButtonStyle: ButtonStyle {
		func makeBody(configuration: Configuration) -> some View {
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

	struct SecondaryButtonStyle: ButtonStyle {
		let tint: SwiftUI.Color

		init(tint: SwiftUI.Color = DS.ColorToken.accent) {
			self.tint = tint
		}

		func makeBody(configuration: Configuration) -> some View {
			configuration.label
				.font(DS.Typography.body.weight(.semibold))
				.foregroundStyle(tint)
				.frame(maxWidth: .infinity, minHeight: DS.Metrics.Control.height)
				.padding(.horizontal, DS.Metrics.Spacing.m)
				.background(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.s, style: .continuous)
						.fill(tint.opacity(configuration.isPressed ? 0.10 : 0.06))
				)
				.overlay(
					RoundedRectangle(cornerRadius: DS.Metrics.Radius.s, style: .continuous)
						.stroke(tint.opacity(0.55), lineWidth: DS.Metrics.BorderWidth.hairline)
				)
		}
	}
}

// MARK: - Inputs

extension DS.Components {
	struct InputTextFieldStyle: SwiftUI.TextFieldStyle {
		func _body(configuration: TextField<_Label>) -> some View {
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

