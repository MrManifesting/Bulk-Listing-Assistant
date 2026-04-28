## 2025-05-15 - NavigationSplitView Empty State Pattern
**Learning:** In SwiftUI `NavigationSplitView`, wrapping conditional sidebar content (e.g., switching between `List` and `ContentUnavailableView`) in a `Group` ensures that `.toolbar` and `.navigationTitle` modifiers remain persistent and correctly placed during state transitions.
**Action:** Always use a `Group` container for conditional sidebar content in `NavigationSplitView` to maintain a consistent navigation interface.
