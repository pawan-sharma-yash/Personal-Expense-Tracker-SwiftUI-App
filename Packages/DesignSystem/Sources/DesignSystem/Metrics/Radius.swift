//
//  Spacing 2.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//


import SwiftUI

extension DS.Metrics {
	/// Corner radius scale. Values preserved for compatibility.
	public enum Radius {
		public static let xxs : CGFloat = 6
		public static let xs : CGFloat = 8
		public static let s: CGFloat = 10
		public static let m: CGFloat = 12
		public static let l: CGFloat = 16
		public static let xl: CGFloat = 20
		public static let xxl: CGFloat = 24

		// Semantic aliases
		public static var card: CGFloat { m }       // 12 pt — default card
		public static var button: CGFloat { s }     // 10 pt — buttons / inputs
		public static var pill: CGFloat { xxl }     // 24 pt — pill / chip
	}
}

extension DS {
	/// Ergonomic alias: `DS.Radius.m`
	public typealias Radius = Metrics.Radius
}
