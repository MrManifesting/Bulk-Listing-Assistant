## 2025-02-25 - Optimizing SwiftData Query with #Index and @Query Sorting

**Learning:** In SwiftData (iOS 18+), adding a database index via the `#Index` macro significantly improves performance for frequently sorted or filtered properties. Offloading sorting to the database level using `@Query(sort: ...)` leverages these indexes and is much more efficient than in-memory sorting, especially as the dataset grows.

**Action:** Always consider adding `#Index` to properties used in `@Query` sort descriptors to ensure the underlying SQLite store can perform these operations efficiently.
