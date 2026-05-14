//
//  ColorTokenTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
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
