//
//  Metrics.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//


import SwiftUI

extension DS.Metrics {
	/// 4-pt / 2-pt hybrid scale. Values are preserved verbatim for compatibility.
	/// New code should prefer the semantic aliases on `DS.Spacing`.
	public enum Spacing {
		public static let xxxxs : CGFloat = 2
		public static let xxxs : CGFloat = 4
		public static let xxs : CGFloat = 6
		public static let xs : CGFloat = 8
		public static let s: CGFloat = 10
		public static let m: CGFloat = 12
		public static let l: CGFloat = 16
		public static let xl: CGFloat = 20
		public static let xxl: CGFloat = 24

		// MARK: Semantic aliases (ergonomic, self-documenting)
		public static var hairline: CGFloat { xxxxs }
		public static var compact: CGFloat { xxxs }
		public static var extraSmall: CGFloat { xxs }
		public static var small: CGFloat { xs }
		public static var medium: CGFloat { m }
		public static var large: CGFloat { l }
		public static var extraLarge: CGFloat { xl }
	}
}

// MARK: - Ergonomic top-level alias

extension DS {
	/// Direct alias: `DS.Spacing.xxxs` instead of `DS.Metrics.Spacing.xxxs`.
	public typealias Spacing = Metrics.Spacing
}
