## 2025-02-25 - SwiftData Indexing for Timestamped Queries
**Learning:** Using the `#Index` macro on properties used for sorting in `@Query` is critical for performance as the dataset grows. In SwiftData, merely adding the index to the model isn't enough; the `@Query` should explicitly specify the sort order to ensure the database engine optimally uses the index.
**Action:** Always verify that frequently filtered or sorted properties in SwiftData models are indexed using `#Index` and that the corresponding `@Query` call sites are configured to use those properties.
