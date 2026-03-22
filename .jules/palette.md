## 2025-02-25 - Sidebar Empty State Pattern in SwiftUI
**Learning:** In SwiftUI `NavigationSplitView`, wrapping the sidebar content in a `Group` allows for conditional switching between a `List` and a `ContentUnavailableView` (empty state) while ensuring that modifiers like `.navigationTitle` and `.toolbar` remain persistent and correctly placed on the sidebar column.
**Action:** Use a `Group` within the sidebar or detail blocks of a `NavigationSplitView` to manage conditional content and maintain consistent navigation and toolbar presentation.
