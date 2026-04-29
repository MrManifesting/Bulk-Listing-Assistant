## 2025-02-25 - [NavigationSplitView Toolbar Persistence]
**Learning:** In a SwiftUI `NavigationSplitView` sidebar, applying `.toolbar` or `.navigationTitle` directly to conditional views (like `if items.isEmpty { ContentUnavailableView(...) } else { List(...) }`) can cause the toolbar to disappear or flicker during state transitions.
**Action:** Wrap the conditional content in a `Group` and apply the `.toolbar` and `.navigationTitle` modifiers to the `Group` itself. This ensures the modifiers remain attached to the sidebar container regardless of which internal view is being displayed.
