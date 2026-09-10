import SwiftUI

/// Central namespace for the design system.
///
/// `DS` groups all tokens (``DS/Color``, ``DS/Typography``, ``DS/Spacing`` …)
/// and components (``DS/Components``) under a single discoverable entry point.
///
/// ## Background
/// The previous iteration spread tokens across `Color` extensions and `DS.Metrics.*`.
/// That made discovery harder and created two sources of truth for colors.
/// This version keeps backwards-compat `Color.xxx` accessors but makes
/// `DS.Color.xxx` the single source of truth.
///
/// ## Usage
/// ```swift
/// Text("Hello").font(DS.Typography.headline).foregroundStyle(DS.Color.textPrimary)
/// VStack(spacing: DS.Spacing.m) { ... }.dsCard()
/// Button("Save") {}.buttonStyle(DS.Components.PrimaryButtonStyle())
/// ```
public enum DS { }

