## 2025-03-13 - SwiftData Database Indexing
**Learning:** SwiftData (iOS 18+) introduced the `#Index` macro to optimize database-driven queries. Without an index, sorting large datasets in `@Query` defaults to a full-table scan ($O(N \log N)$).
**Action:** Always verify if a property used in `@Query` sorting or filtering has a corresponding `#Index` defined in the `@Model` class.
