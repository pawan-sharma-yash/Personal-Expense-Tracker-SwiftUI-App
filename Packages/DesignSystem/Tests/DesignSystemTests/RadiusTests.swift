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
