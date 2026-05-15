//
//  ControlTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - Control Tests

@Suite("DS.Metrics.Control")
struct ControlTests {

	/// Apple HIG recommends a minimum tap target of 44 pt.
	@Test() func `control height meets HIG minimum`() {
		#expect(DS.Metrics.Control.height >= 44)
	}

	/// minTapTarget must independently satisfy the 44 pt HIG requirement.
	@Test() func `min tap target meets HIG minimum`() {
		#expect(DS.Metrics.Control.minTapTarget >= 44)
	}

	/// The control height should not be smaller than the declared minimum tap target.
	@Test() func `control height is not smaller than min tap target`() {
		#expect(DS.Metrics.Control.height >= DS.Metrics.Control.minTapTarget)
	}

	/// Exact contract values.
	@Test() func `control token values match expected constants`() {
		#expect(DS.Metrics.Control.height == 44)
		#expect(DS.Metrics.Control.minTapTarget == 44)
	}
}
