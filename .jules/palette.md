## 2025-03-18 - Persistent Toolbars in NavigationSplitView
**Learning:** In SwiftUI's `NavigationSplitView`, when conditionally switching between a `List` and a `ContentUnavailableView` in the sidebar, wrapping the conditional content in a `Group` and applying `.navigationTitle` and `.toolbar` to that `Group` ensures the UI elements remain persistent and correctly placed during state transitions.
**Action:** Always use a `Group` wrapper for conditional sidebar content in `NavigationSplitView` to maintain a stable navigation interface.
