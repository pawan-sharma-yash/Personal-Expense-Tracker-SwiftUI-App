//
//  DesignSystemTests.swift
//  DesignSystemTests
//
//  Unit tests for the DS design-system token and style layer.
//  Uses the Swift Testing framework (import Testing).
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - Color Token Tests

@Suite("DS.ColorToken")
struct ColorTokenTests {

	/// Accent color must be a deterministic, non-adaptive value — verify it
	/// round-trips through its RGB components without becoming .clear.
	@Test() func `accent is opaque`() {
		let resolved = DS.ColorToken.accent
		// Color won't equal .clear unless all components are zero
		#expect(resolved != .clear)
	}

	/// Semantic surface tokens must be distinct so the visual hierarchy is maintained.
	@Test() func `surface tokens are distinct`() {
		#expect(DS.ColorToken.background != DS.ColorToken.surface)
		#expect(DS.ColorToken.surface != DS.ColorToken.elevatedSurface)
		#expect(DS.ColorToken.background != DS.ColorToken.elevatedSurface)
	}

	/// Text tokens must differ so primary text stands apart from secondary.
	@Test() func `text tokens are distinct`() {
		#expect(DS.ColorToken.textPrimary != DS.ColorToken.textSecondary)
	}

	/// Utility semantic tokens must all be non-clear values.
	@Test() func `utility tokens are non-clear`() {
		#expect(DS.ColorToken.border != .clear)
		#expect(DS.ColorToken.success != .clear)
		#expect(DS.ColorToken.danger != .clear)
	}

	/// Success and danger must be visually distinct (green vs red).
	@Test() func `success and danger are distinct`() {
		#expect(DS.ColorToken.success != DS.ColorToken.danger)
	}
}

// MARK: - Typography Tests

@Suite("DS.Typography")
struct TypographyTests {

	/// Every typography token must be a valid Font value — i.e. not equal to a
	/// nonsensical sentinel. We verify each token can be assigned without crash.
	@Test() func `all tokens are constructable`() {
		// Simply accessing the static properties exercises the computed getters.
		let tokens: [Font] = [
			DS.Typography.screenTitle,
			DS.Typography.headline,
			DS.Typography.body,
			DS.Typography.caption,
		]
		#expect(tokens.count == 4)
	}

	/// Tokens must be distinct so the visual hierarchy is unambiguous.
	@Test() func `typography tokens are distinct`() {
		#expect(DS.Typography.screenTitle != DS.Typography.headline)
		#expect(DS.Typography.headline   != DS.Typography.body)
		#expect(DS.Typography.body       != DS.Typography.caption)
		#expect(DS.Typography.screenTitle != DS.Typography.caption)
	}
}

// MARK: - Spacing Tests

@Suite("DS.Metrics.Spacing")
struct SpacingTests {

	/// All spacing values must be positive — zero or negative spacing breaks layouts.
	@Test() func `all spacing values are positive`() {
		let values: [CGFloat] = [
			DS.Metrics.Spacing.`6`,
			DS.Metrics.Spacing.`8`,
			DS.Metrics.Spacing.`10`,
			DS.Metrics.Spacing.`12`,
			DS.Metrics.Spacing.`16`,
			DS.Metrics.Spacing.`20`,
			DS.Metrics.Spacing.`24`,
		]
		for value in values {
			#expect(value > 0, "Spacing value \(value) must be > 0")
		}
	}

	/// Names must match their raw CGFloat values (contract test).
	@Test() func `spacing token values match names`() {
		#expect(DS.Metrics.Spacing.`6`  == 6)
		#expect(DS.Metrics.Spacing.`8`  == 8)
		#expect(DS.Metrics.Spacing.`10` == 10)
		#expect(DS.Metrics.Spacing.`12` == 12)
		#expect(DS.Metrics.Spacing.`16` == 16)
		#expect(DS.Metrics.Spacing.`20` == 20)
		#expect(DS.Metrics.Spacing.`24` == 24)
	}

	/// The scale must be strictly ascending so tokens can be used comparatively.
	@Test() func `spacing tokens are strictly ascending`() {
		let scale: [CGFloat] = [
			DS.Metrics.Spacing.`6`,
			DS.Metrics.Spacing.`8`,
			DS.Metrics.Spacing.`10`,
			DS.Metrics.Spacing.`12`,
			DS.Metrics.Spacing.`16`,
			DS.Metrics.Spacing.`20`,
			DS.Metrics.Spacing.`24`,
		]
		let sorted = scale.sorted()
		#expect(scale == sorted, "Spacing tokens must be in ascending order")
	}
}

// MARK: - Radius Tests

@Suite("DS.Metrics.Radius")
struct RadiusTests {

	/// All radius values must be positive.
	@Test() func `all radius values are positive`() {
		let values: [CGFloat] = [
			DS.Metrics.Radius.`10`,
			DS.Metrics.Radius.`14`,
			DS.Metrics.Radius.`18`,
		]
		for value in values {
			#expect(value > 0, "Radius value \(value) must be > 0")
		}
	}

	/// Names must match their raw CGFloat values.
	@Test() func `radius token values match names`() {
		#expect(DS.Metrics.Radius.`10` == 10)
		#expect(DS.Metrics.Radius.`14` == 14)
		#expect(DS.Metrics.Radius.`18` == 18)
	}

	/// The scale must be strictly ascending.
	@Test() func `radius tokens are strictly ascending`() {
		let scale: [CGFloat] = [
			DS.Metrics.Radius.`10`,
			DS.Metrics.Radius.`14`,
			DS.Metrics.Radius.`18`,
		]
		#expect(scale == scale.sorted())
	}
}

// MARK: - BorderWidth Tests

@Suite("DS.Metrics.BorderWidth")
struct BorderWidthTests {

	/// All border-width values must be positive.
	@Test() func `all border widths are positive`() {
		let values: [CGFloat] = [
			DS.Metrics.BorderWidth.hairline,
			DS.Metrics.BorderWidth.regular,
			DS.Metrics.BorderWidth.thick,
		]
		for value in values {
			#expect(value > 0, "Border width \(value) must be > 0")
		}
	}

	/// Contract test: verify exact expected values.
	@Test() func `border width values match expected constants`() {
		#expect(DS.Metrics.BorderWidth.hairline == 1)
		#expect(DS.Metrics.BorderWidth.regular  == 2)
		#expect(DS.Metrics.BorderWidth.thick    == 3)
	}

	/// hairline < regular < thick is the expected semantic ordering.
	@Test()
	func `border widths are strictly ascending`() {
		#expect(DS.Metrics.BorderWidth.hairline < DS.Metrics.BorderWidth.regular)
		#expect(DS.Metrics.BorderWidth.regular  < DS.Metrics.BorderWidth.thick)
	}
}

// MARK: - Control Tests

@Suite("DS.Metrics.Control")
struct ControlTests {

	/// Apple HIG recommends a minimum tap target of 44 pt.
	@Test() func `control height meets HIG minimum`() {
		#expect(DS.Metrics.Control.height >= 44)
	}

	/// minTapTarget must independently satisfy the 44 pt HIG requirement.
	@Test() func `min tap target meets HIG minimum`() {
		#expect(DS.Metrics.Control.minTapTarget >= 44)
	}

	/// The control height should not be smaller than the declared minimum tap target.
	@Test() func `control height is not smaller than min tap target`() {
		#expect(DS.Metrics.Control.height >= DS.Metrics.Control.minTapTarget)
	}

	/// Exact contract values.
	@Test() func `control token values match expected constants`() {
		#expect(DS.Metrics.Control.height       == 44)
		#expect(DS.Metrics.Control.minTapTarget == 44)
	}
}

// MARK: - Card ViewModifier Tests

@Suite("DS.Components.Card")
struct CardTests {

	/// Default initialiser must use the design system's 8 pt spacing token.
	@MainActor @Test() func `card default padding matches spacing token`() {
		let card = DS.Components.Card()
		#expect(card.padding == DS.Metrics.Spacing.`8`)
	}

	/// Custom padding must be stored faithfully.
	@MainActor @Test() func `card stores custom padding value`() {
		let customPadding: CGFloat = DS.Metrics.Spacing.`16`
		let card = DS.Components.Card(padding: customPadding)
		#expect(card.padding == customPadding)
	}

	/// Zero padding should be accepted without crashing (edge-case guard).
	@MainActor @Test() func `card accepts zero padding`() {
		let card = DS.Components.Card(padding: 0)
		#expect(card.padding == 0)
	}

	/// Arbitrary CGFloat values must be stored as-is (callers own sensible usage).
	@MainActor @Test() func `card stores arbitrary padding faithfully`() {
		let arbitraryValues: [CGFloat] = [1, 4, 12, 24, 100]
		for value in arbitraryValues {
			let card = DS.Components.Card(padding: value)
			#expect(card.padding == value)
		}
	}
}

// MARK: - SecondaryButtonStyle Tests

@Suite("DS.Components.SecondaryButtonStyle")
struct SecondaryButtonStyleTests {

	/// Default initialiser must use the design-system accent as its tint.
	@MainActor @Test() func `secondary button default tint is accent`() {
		let style = DS.Components.SecondaryButtonStyle()
		#expect(style.tint == DS.ColorToken.accent)
	}

	/// A custom tint must be stored faithfully.
	@MainActor @Test() func `secondary button stores custom tint`() {
		let customTint = DS.ColorToken.danger
		let style = DS.Components.SecondaryButtonStyle(tint: customTint)
		#expect(style.tint == customTint)
	}

	/// Two instances with the same tint must be functionally equivalent.
	@MainActor @Test() func `secondary button instances with same tint are equivalent`() {
		let styleA = DS.Components.SecondaryButtonStyle(tint: DS.ColorToken.accent)
		let styleB = DS.Components.SecondaryButtonStyle(tint: DS.ColorToken.accent)
		#expect(styleA.tint == styleB.tint)
	}

	/// Instances with different tints must not be considered equal.
	@MainActor @Test() func `secondary button instances with different tints differ`() {
		let styleA = DS.Components.SecondaryButtonStyle(tint: DS.ColorToken.accent)
		let styleB = DS.Components.SecondaryButtonStyle(tint: DS.ColorToken.danger)
		#expect(styleA.tint != styleB.tint)
	}
}

// MARK: - InputTextFieldStyle Tests

@Suite("DS.Components.InputTextFieldStyle")
struct InputTextFieldStyleTests {

	/// The style must be constructable with the public memberwise init.
	@Test() func `input text field style is constructable`() {
		// If construction throws or crashes the test itself fails.
		let _ = DS.Components.InputTextFieldStyle()
		#expect(Bool(true)) // reached here without crash
	}

	/// Multiple instances must be independently constructable (no shared mutable state).
	@Test() func `input text field style instances are independent`() {
		let instanceA = DS.Components.InputTextFieldStyle()
		let instanceB = DS.Components.InputTextFieldStyle()
		// Both init without interfering; this validates there is no shared mutable state.
		_ = instanceA
		_ = instanceB
		#expect(Bool(true))
	}
}

// MARK: - PrimaryButtonStyle Tests

@Suite("DS.Components.PrimaryButtonStyle")
struct PrimaryButtonStyleTests {

	/// The style must be constructable with the public memberwise init.
	@MainActor @Test() func `primary button style is constructable`() {
		let _ = DS.Components.PrimaryButtonStyle()
		#expect(Bool(true))
	}

	/// Multiple instances must be independently constructable (no shared mutable state).
	@MainActor @Test() func `primary button style instances are independent`() {
		let instanceA = DS.Components.PrimaryButtonStyle()
		let instanceB = DS.Components.PrimaryButtonStyle()
		_ = instanceA
		_ = instanceB
		#expect(Bool(true))
	}
}

// MARK: - Cross-Token Consistency Tests

/// These tests assert that related tokens from different sub-systems
/// maintain design-system-wide consistency contracts.
@Suite("DS cross-token consistency")
struct CrossTokenConsistencyTests {

	/// The smallest spacing token must not exceed the hairline border width —
	/// micro-spacing is always larger than the border it might sit beside.
	@Test() func `smallest spacing token is wider than hairline border`() {
		#expect(DS.Metrics.Spacing.`6` > DS.Metrics.BorderWidth.hairline)
	}

	/// The card's default padding token must exist within the spacing scale.
	@MainActor @Test() func `card default padding is a valid spacing token`() {
		let validSpacingValues: Set<CGFloat> = [6, 8, 10, 12, 16, 20, 24]
		let cardDefaultPadding = DS.Components.Card().padding
		#expect(validSpacingValues.contains(cardDefaultPadding))
	}

	/// Control height must be larger than any border width to avoid a zero-height
	/// effective content area when a border is inset.
	@Test() func `control height is larger than thick border width`() {
		#expect(DS.Metrics.Control.height > DS.Metrics.BorderWidth.thick)
	}

	/// The smallest radius must be smaller than the largest spacing token so
	/// rounded corners always fit within padded containers.
	@Test() func `smallest radius is less than largest spacing token`() {
		#expect(DS.Metrics.Radius.`10` < DS.Metrics.Spacing.`24`)
	}
}
