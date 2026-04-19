## 2025-02-25 - [SwiftData Indexing for Query Performance]
**Learning:** Default SwiftData queries without explicit sorting or indexing can lead to O(N) or O(N log N) performance as the dataset grows. By adding the `#Index` macro to frequently queried and sorted properties, database retrieval becomes significantly more efficient (O(log N)).
**Action:** Always check if properties used in `@Query` (especially for sorting) are indexed in the `@Model` definition. Use the `#Index` macro to ensure the underlying database can optimize these operations.
