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
			DS.Metrics.Spacing.xxxxs,
			DS.Metrics.Spacing.xxxs,
			DS.Metrics.Spacing.xxs,
			DS.Metrics.Spacing.xs,
			DS.Metrics.Spacing.s,
			DS.Metrics.Spacing.m,
			DS.Metrics.Spacing.l,
			DS.Metrics.Spacing.xl,
			DS.Metrics.Spacing.xxl
		]
		for value in values {
			#expect(value > 0, "Spacing value \(value) must be > 0")
		}
	}

	/// Names must match their raw CGFloat values (contract test).
	@Test() func `spacing token values match names`() {
		#expect(DS.Metrics.Spacing.xxs == 6)
		#expect(DS.Metrics.Spacing.xs == 8)
		#expect(DS.Metrics.Spacing.s == 10)
		#expect(DS.Metrics.Spacing.m == 12)
		#expect(DS.Metrics.Spacing.l == 16)
		#expect(DS.Metrics.Spacing.xl == 20)
		#expect(DS.Metrics.Spacing.xxl == 24)
	}

	/// The scale must be strictly ascending so tokens can be used comparatively.
	@Test() func `spacing tokens are strictly ascending`() {
		let scale: [CGFloat] = [
			DS.Metrics.Spacing.xxxxs,
			DS.Metrics.Spacing.xxxs,
			DS.Metrics.Spacing.xxs,
			DS.Metrics.Spacing.xs,
			DS.Metrics.Spacing.s,
			DS.Metrics.Spacing.m,
			DS.Metrics.Spacing.l,
			DS.Metrics.Spacing.xl,
			DS.Metrics.Spacing.xxl
		]
		let sorted = scale.sorted()
		#expect(scale == sorted, "Spacing tokens must be in ascending order")
	}
}
