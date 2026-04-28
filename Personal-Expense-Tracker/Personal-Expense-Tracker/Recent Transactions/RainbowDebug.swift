//
//  File.swift
//  Personal-Expense-Tracker
//
//  Created by Pawan Kumar Sharma on 28/04/26.
//

import SwiftUI

#if DEBUG
  fileprivate let rainbowDebugColors: [Color] = [
    .purple, .blue, .green,
    .yellow, .orange, .red,
    .mint, .cyan, .pink, .teal,
  ]

  extension View {
    func rainbowDebug() -> some View {
      background(rainbowDebugColors.randomElement()!)
    }
  }
#else
  extension View {
    func rainbowDebug() -> some View { self }
  }
#endif
