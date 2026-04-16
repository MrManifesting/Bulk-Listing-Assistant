# Bolt's Journal - Critical Learnings Only
## 2026-04-16 - [SwiftData Indexing for Query Performance]
**Learning:** In SwiftData, simply adding the `#Index` macro to a model property is not enough to ensure optimal performance for `@Query`. The query must explicitly specify a sort descriptor that matches the indexed property to allow the underlying SQLite database to utilize the B-Tree index effectively.
**Action:** Always pair `#Index` on model properties with explicit sorting in `@Query` or `FetchDescriptor` to avoid full table scans and O(N) sorting overhead.
