## 2025-02-25 - Sidebar Empty States in NavigationSplitView
**Learning:** In SwiftUI 'NavigationSplitView', wrap sidebar content in a 'Group' to allow conditional switching between 'List' and 'ContentUnavailableView' while preserving toolbar and navigation title placement. If applied directly to the conditional views, these modifiers can be lost or misplaced during transitions.
**Action:** Always wrap conditional sidebar content in a 'Group' or 'VStack' and apply navigation modifiers to the wrapper.
