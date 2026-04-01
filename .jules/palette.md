# Palette's UX Journal

## 2025-02-25 - ContentUnavailableView in NavigationSplitView
**Learning:** In SwiftUI `NavigationSplitView`, wrapping sidebar content in a `Group` allows for clean conditional switching between a `List` and a `ContentUnavailableView` while keeping the `.navigationTitle` and `.toolbar` consistent on the sidebar.
**Action:** Always wrap sidebar content in a `Group` when implementing empty states to preserve the navigation structure.
