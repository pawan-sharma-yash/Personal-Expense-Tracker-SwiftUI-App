//
//  EmtpyState.swift
//  ViewModels
//
//  Created by Pawan Kumar Sharma on 28/04/26.
//

public struct EmtpyState {
	public let title: String
	public let actionTitle: String
	public let subTitle: String

	public init(title: String, actionTitle: String, subTitle: String) {
		self.title = title
		self.actionTitle = actionTitle
		self.subTitle = subTitle
	}
}
