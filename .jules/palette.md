# Palette's Journal - Critical UX/Accessibility Learnings

## Format:
## YYYY-MM-DD - [Title]
**Learning:** [UX/a11y insight]
**Action:** [How to apply next time]

---

## 2025-05-14 - Preserving Sidebar State in NavigationSplitView
**Learning:** In SwiftUI `NavigationSplitView`, when conditionally switching between a `List` and an empty state view (like `ContentUnavailableView`) in the sidebar, wrapping them in a `Group` allows modifiers like `.navigationTitle` and `.toolbar` to remain persistent and correctly positioned.
**Action:** Always wrap conditional sidebar content in a `Group` when using `NavigationSplitView` to ensure UI consistency during state transitions.
