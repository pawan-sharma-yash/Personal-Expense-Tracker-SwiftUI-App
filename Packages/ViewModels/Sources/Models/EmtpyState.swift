//
//  EmtpyState.swift
//  ViewModels
//
//  Created by Pawan Kumar Sharma on 28/04/26.
//


public struct EmtpyState {
	public let message: String
	public let actionTitle: String

	public init(message: String, actionTitle: String) {
		self.message = message
		self.actionTitle = actionTitle
	}
}