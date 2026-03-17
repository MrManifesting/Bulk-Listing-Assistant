## 2025-03-17 - Improved Empty States with ContentUnavailableView
**Learning:** Using `ContentUnavailableView` provides a much more polished and accessible "first run" and "no selection" experience in SwiftUI than simple text labels, especially when combined with a clear Call-to-Action (CTA).
**Action:** Always prefer `ContentUnavailableView` for empty lists and detail view placeholders in modern SwiftUI apps (iOS 17+).

## 2025-03-17 - Grouping Sidebar Content in NavigationSplitView
**Learning:** Wrapping the sidebar content in a `Group` allows for conditional logic (e.g., switching between a `List` and an empty state view) while ensuring that common modifiers like `.navigationTitle` and `.toolbar` remain consistently placed and functional across both states.
**Action:** Use `Group` to wrap conditional sidebar content in `NavigationSplitView` to maintain a stable navigation interface.
