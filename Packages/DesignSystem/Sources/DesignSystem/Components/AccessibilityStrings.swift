import Foundation

/// Centralized accessibility labels and hints used throughout the app.
///
/// Keeping these here (in the `DesignSystem` package) makes it easier to
/// localize and maintain accessibility copy in one place.
public enum AccessibilityStrings {
    public enum Label {
        /// Combined transaction row label. Use a formatted amount string.
        public static func transaction(title: String, category: String, amount: String, date: String) -> String {
            "\(title), \(category) category, \(amount), \(date)"
        }

        /// Short label for add button
        public static var addTransaction: String { "Add transaction" }

        /// Generic empty-state action label (usually the button title)
        public static func emptyStateAction(_ title: String) -> String { title }
    }

    public enum Hint {
        /// Hint for the add transaction button
        public static var addTransaction: String { "Opens add new transaction screen" }

        /// Hint for an empty state action button
        public static func emptyStateAction(_ title: String) -> String {
            "\(title) to add a new transaction"
        }
    }
}
