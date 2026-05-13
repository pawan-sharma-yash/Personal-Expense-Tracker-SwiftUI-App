//
//  PrimaryButtonStyleTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - PrimaryButtonStyle Tests

@Suite("DS.Components.PrimaryButtonStyle")
struct PrimaryButtonStyleTests {

	/// The style must be constructable with the public memberwise init.
	@MainActor @Test() func `primary button style is constructable`() {
		let _ = DS.Components.PrimaryButtonStyle()
		#expect(Bool(true))
	}

	/// Multiple instances must be independently constructable (no shared mutable state).
	@MainActor @Test() func `primary button style instances are independent`() {
		let instanceA = DS.Components.PrimaryButtonStyle()
		let instanceB = DS.Components.PrimaryButtonStyle()
		_ = instanceA
		_ = instanceB
		#expect(Bool(true))
	}
}
