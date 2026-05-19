//
//  ExpensePeriod.swift
//  ViewModels
//
//  Created by Pawan Kumar Sharma on 28/04/26.
//

public enum ExpensePeriod: String, Sendable, CaseIterable, Identifiable {
	case day = "Daily"
	case week = "Weekly"
	case month = "Monthly"
	public var id: String { rawValue }
}
