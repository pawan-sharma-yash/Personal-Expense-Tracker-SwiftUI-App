//
//  RouterPath.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import Observation

@MainActor
@Observable
final class RouterPath {
	public var path: [RouterDestination] = []

	public init() { }
}
