## 2025-05-22 - [Reusable Security Pattern: Data Protection for SwiftData]
**Vulnerability:** Default SwiftData/Core Data storage may not have the highest level of encryption-at-rest protection enabled by default, depending on system configuration.
**Learning:** Explicitly setting the `NSFileProtectionKey` on the Application Support directory before initializing the `ModelContainer` ensures that the database inherits proper file protection (e.g., `.completeUntilFirstUserAuthentication`).
**Prevention:** Always initialize the database directory with appropriate security attributes during app startup to provide defense-in-depth for user data.
