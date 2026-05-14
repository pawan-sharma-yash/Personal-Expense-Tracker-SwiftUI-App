//
//  BorderWidthTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - BorderWidth Tests

@Suite("DS.Metrics.BorderWidth")
struct BorderWidthTests {

	/// All border-width values must be positive.
	@Test() func `all border widths are positive`() {
		let values: [CGFloat] = [
			DS.Metrics.BorderWidth.hairline,
			DS.Metrics.BorderWidth.regular,
			DS.Metrics.BorderWidth.thick,
		]
		for value in values {
			#expect(value > 0, "Border width \(value) must be > 0")
		}
	}

	/// Contract test: verify exact expected values.
	@Test() func `border width values match expected constants`() {
		#expect(DS.Metrics.BorderWidth.hairline == 1)
		#expect(DS.Metrics.BorderWidth.regular  == 2)
		#expect(DS.Metrics.BorderWidth.thick    == 3)
	}

	/// hairline < regular < thick is the expected semantic ordering.
	@Test()
	func `border widths are strictly ascending`() {
		#expect(DS.Metrics.BorderWidth.hairline < DS.Metrics.BorderWidth.regular)
		#expect(DS.Metrics.BorderWidth.regular  < DS.Metrics.BorderWidth.thick)
	}
}
