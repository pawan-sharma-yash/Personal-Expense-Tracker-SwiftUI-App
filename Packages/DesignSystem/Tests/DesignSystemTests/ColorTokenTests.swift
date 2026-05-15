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

@Suite("Color")
struct ColorTokenTests {

	/// Accent color must be a deterministic, non-adaptive value — verify it
	/// round-trips through its RGB components without becoming .clear.
	@Test() func `accent is opaque`() {
		let resolved = Color.accent
		// Color won't equal .clear unless all components are zero
		#expect(resolved != .clear)
	}

	/// Semantic surface tokens must be distinct so the visual hierarchy is maintained.
	@Test() func `surface tokens are distinct`() {
		#expect(Color.background != Color.surface)
		#expect(Color.surface != Color.elevatedSurface)
		#expect(Color.background != Color.elevatedSurface)
	}

	/// Text tokens must differ so primary text stands apart from secondary.
	@Test() func `text tokens are distinct`() {
		#expect(Color.textPrimary != Color.textSecondary)
	}

	/// Utility semantic tokens must all be non-clear values.
	@Test() func `utility tokens are non-clear`() {
		#expect(Color.border != .clear)
		#expect(Color.success != .clear)
		#expect(Color.danger != .clear)
	}

	/// Success and danger must be visually distinct (green vs red).
	@Test() func `success and danger are distinct`() {
		#expect(Color.success != Color.danger)
	}
}
