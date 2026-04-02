## 2025-02-25 - ContentUnavailableView for NavigationSplitView
**Learning:** In a `NavigationSplitView`, the `detail` view should use `ContentUnavailableView` to provide a clear, accessible guide for users when no item is selected. Similarly, the sidebar should use it for empty states, wrapped in a `Group` to maintain persistent toolbars and titles.
**Action:** Always use `ContentUnavailableView` for empty/unselected states in SwiftUI apps targeting modern platforms (iOS 17+, macOS 14+).
