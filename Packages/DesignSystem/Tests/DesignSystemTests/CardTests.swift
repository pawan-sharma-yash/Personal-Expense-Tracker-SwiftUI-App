//
//  CardTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - Card ViewModifier Tests

@Suite("DS.Components.Card")
struct CardTests {

	/// Default initialiser must use the design system's 8 pt spacing token.
	@MainActor @Test() func `card default padding matches spacing token`() {
		let card = DS.Components.Card()
		#expect(card.padding == DS.Metrics.Spacing.xs)
	}

	/// Custom padding must be stored faithfully.
	@MainActor @Test() func `card stores custom padding value`() {
		let customPadding: CGFloat = DS.Metrics.Spacing.l
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
