## 2025-02-25 - Improved Empty States and Navigation
**Learning:** Using `ContentUnavailableView` for empty states in SwiftUI (iOS 17+) provides a consistent and accessible way to guide users when data is missing. Additionally, hiding the `EditButton` in the toolbar when a list is empty prevents useless interactions and maintains a cleaner interface.
**Action:** Always implement empty state views using `ContentUnavailableView` for lists and detail views. Ensure that editing controls are only visible when there is content to edit.
