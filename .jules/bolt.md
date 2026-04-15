## 2026-04-15 - SwiftData Indexed Sorting
**Learning:** For apps targeting iOS 18.2+, using the `#Index` macro on properties used in `@Query` sorting significantly improves retrieval performance. It moves the sorting responsibility to the database layer, avoiding expensive in-memory sorts.
**Action:** Always check if properties used in `@Query(sort:...)` are indexed, especially for lists that can grow large. Use the `#Index` macro in the `@Model` definition.
