# Palette's Journal - UX & Accessibility Learnings

## 2025-02-25 - ContentUnavailableView for empty states
**Learning:** Using `ContentUnavailableView` (iOS 17+) provides a consistent, accessible, and visually integrated way to handle empty states in `NavigationSplitView` sidebars and detail views compared to simple `Text`.
**Action:** Always prefer `ContentUnavailableView` for empty lists and unselected detail views in modern SwiftUI apps to provide better user guidance.

## 2025-02-25 - Grouping sidebar content for conditional lists
**Learning:** In a `NavigationSplitView` sidebar, wrapping the conditional logic (e.g., `if items.isEmpty`) inside a `Group` ensures that view modifiers like `.navigationTitle` and `.toolbar` are applied correctly regardless of which branch is active.
**Action:** Use `Group` to wrap conditional sidebar content to maintain consistent navigation and toolbar presentation.
