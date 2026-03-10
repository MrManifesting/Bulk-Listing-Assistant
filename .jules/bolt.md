## 2025-02-25 - Optimize Item query performance with SwiftData #Index
**Learning:** In SwiftData, the `#Index` macro (available in iOS 18+) is critical for maintaining performance as the database grows, especially for properties frequently used in `@Query` sorting or filtering. Without it, every query would require a full table scan, leading to O(n) performance degradation.
**Action:** Always add `#Index` to any property used in a `@Query` sort or frequent predicate to ensure O(log n) lookup and sort performance.
