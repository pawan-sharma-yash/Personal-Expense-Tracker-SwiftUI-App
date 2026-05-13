//
//  SecondaryButtonStyleTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

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
