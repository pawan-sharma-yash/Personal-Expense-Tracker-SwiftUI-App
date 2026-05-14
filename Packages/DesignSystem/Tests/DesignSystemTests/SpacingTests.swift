//
//  SpacingTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

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
