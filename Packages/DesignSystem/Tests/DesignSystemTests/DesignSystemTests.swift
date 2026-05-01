import Testing
@testable import DesignSystem

@Test
func designSystem_smokeTest() {
	_ = DS.Metrics.Spacing.m
}

@Suite("DesignSystem Metrics")
struct DesignSystemMetricsTests {
	@Test func `spacing values are positive and ordered`() {
		#expect(DS.Metrics.Spacing.xs > 0)
		#expect(DS.Metrics.Spacing.s > DS.Metrics.Spacing.xs)
		#expect(DS.Metrics.Spacing.m > DS.Metrics.Spacing.s)
		#expect(DS.Metrics.Spacing.l > DS.Metrics.Spacing.m)
	}

	@Test func `radius values are positive and ordered`() {
		#expect(DS.Metrics.Radius.s > 0)
		#expect(DS.Metrics.Radius.m > DS.Metrics.Radius.s)
		#expect(DS.Metrics.Radius.l > DS.Metrics.Radius.m)
	}

	@Test func `border widths are positive and ordered`() {
		#expect(DS.Metrics.BorderWidth.hairline > 0)
		#expect(DS.Metrics.BorderWidth.regular > DS.Metrics.BorderWidth.hairline)
		#expect(DS.Metrics.BorderWidth.thick > DS.Metrics.BorderWidth.regular)
	}

	@Test func `control sizing meets minimum tap target`() {
		#expect(DS.Metrics.Control.height >= DS.Metrics.Control.minTapTarget)
		#expect(DS.Metrics.Control.minTapTarget >= 44)
	}
}

@Suite("DesignSystem Tokens + Components")
@MainActor
struct DesignSystemTokensAndComponentsTests {
	@Test func `color tokens can be referenced`() {
		_ = DS.ColorToken.accent
		_ = DS.ColorToken.background
		_ = DS.ColorToken.surface
		_ = DS.ColorToken.elevatedSurface
		_ = DS.ColorToken.textPrimary
		_ = DS.ColorToken.textSecondary
		_ = DS.ColorToken.border
		_ = DS.ColorToken.success
		_ = DS.ColorToken.danger
	}

	@Test func `typography tokens can be referenced`() {
		_ = DS.Typography.screenTitle
		_ = DS.Typography.headline
		_ = DS.Typography.body
		_ = DS.Typography.caption
	}

	@Test func `card uses medium spacing by default`() {
		let card = DS.Components.Card()
		#expect(card.padding == DS.Metrics.Spacing.m)
	}

	@Test func `card accepts custom padding`() {
		let card = DS.Components.Card(padding: 123)
		#expect(card.padding == 123)
	}

	@Test func `secondary button style uses accent tint by default`() {
		let style = DS.Components.SecondaryButtonStyle()
		#expect(style.tint == DS.ColorToken.accent)
	}

	@Test func `secondary button style accepts custom tint`() {
		let style = DS.Components.SecondaryButtonStyle(tint: .red)
		#expect(style.tint == .red)
	}

	@Test func `primary button style and text field style are constructible`() {
		_ = DS.Components.PrimaryButtonStyle()
		_ = DS.Components.InputTextFieldStyle()
	}
}

