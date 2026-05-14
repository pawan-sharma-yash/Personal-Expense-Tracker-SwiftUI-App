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
