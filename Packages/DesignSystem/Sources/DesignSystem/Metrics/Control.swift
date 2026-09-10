//
//  Control.swift
//  DesignSystem
//
//  Created by Pawan Kumar Sharma on 06/05/26.
//

import SwiftUI

extension DS.Metrics {
	/// Control sizing — honours 44 pt HIG minimum.
	public enum Control {
		public static let height: CGFloat = 44
		public static let minTapTarget: CGFloat = 44
		/// Compact control height for dense rows.
		public static let compactHeight: CGFloat = 36
		/// Large control for primary actions.
		public static let largeHeight: CGFloat = 52
	}
}

extension DS {
	public typealias Control = Metrics.Control
}
