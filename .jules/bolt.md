## 2025-02-25 - SwiftData Indexing for Performance
**Learning:** In SwiftData (iOS 18+), adding a `#Index` macro to model properties that are frequently used for sorting or filtering significantly improves query performance. Note that the correct syntax for the macro is `#Index([\.property])` without explicit generic type arguments at the call site.
**Action:** Always check if `@Query` properties use sorting or filtering, and add corresponding `#Index` macros to the model using the correct non-generic syntax to optimize data retrieval.
