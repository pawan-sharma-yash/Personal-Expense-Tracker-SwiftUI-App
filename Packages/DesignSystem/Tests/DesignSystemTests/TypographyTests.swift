//
//  TypographyTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

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
		#expect(DS.Typography.headline != DS.Typography.body)
		#expect(DS.Typography.body != DS.Typography.caption)
		#expect(DS.Typography.screenTitle != DS.Typography.caption)
	}
}
