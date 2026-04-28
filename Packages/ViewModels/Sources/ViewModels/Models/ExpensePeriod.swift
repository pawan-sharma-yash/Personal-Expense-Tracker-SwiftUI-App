//
//  ExpensePeriod.swift
//  ViewModels
//
//  Created by Pawan Kumar Sharma on 28/04/26.
//

public enum ExpensePeriod: String, CaseIterable, Identifiable {
	case daily = "Daily"
	case weekly = "Weekly"
	case monthly = "Monthly"
	public var id: String { rawValue }
}
