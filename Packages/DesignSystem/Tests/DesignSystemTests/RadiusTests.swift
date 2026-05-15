//
//  RadiusTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - Radius Tests

@Suite("DS.Metrics.Radius")
struct RadiusTests {

	/// All radius values must be positive.
	@Test() func `all radius values are positive`() {
		let values: [CGFloat] = [
			DS.Metrics.Radius.xxs,
			DS.Metrics.Radius.xs,
			DS.Metrics.Radius.s,
			DS.Metrics.Radius.m,
			DS.Metrics.Radius.l,
			DS.Metrics.Radius.xl,
			DS.Metrics.Radius.xxl
		]
		for value in values {
			#expect(value > 0, "Radius value \(value) must be > 0")
		}
	}

	/// Names must match their raw CGFloat values.
	@Test() func `radius token values match names`() {
		#expect(DS.Metrics.Radius.xxs == 6)
		#expect(DS.Metrics.Radius.xs == 8)
		#expect(DS.Metrics.Radius.s == 10)
		#expect(DS.Metrics.Radius.m == 12)
		#expect(DS.Metrics.Radius.l == 16)
		#expect(DS.Metrics.Radius.xl == 20)
		#expect(DS.Metrics.Radius.xxl == 24)
	}

	/// The scale must be strictly ascending.
	@Test() func `radius tokens are strictly ascending`() {
		let scale: [CGFloat] = [
			DS.Metrics.Radius.xxs,
			DS.Metrics.Radius.xs,
			DS.Metrics.Radius.s,
			DS.Metrics.Radius.m,
			DS.Metrics.Radius.l,
			DS.Metrics.Radius.xl,
			DS.Metrics.Radius.xxl
		]
		#expect(scale == scale.sorted())
	}
}
