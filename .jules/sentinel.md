## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, simply setting file protection on the Application Support directory is not enough; SwiftData’s backing store file (or the URL passed into `ModelConfiguration`) itself must have `NSFileProtectionCompleteUntilFirstUserAuthentication` (or the desired protection class) applied to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. During initialization, ensure the SwiftData database file (or a pre-created URL used by `ModelConfiguration`) is created with the appropriate `fileProtectionKey` so that the data is actually stored with the desired file protection.

## 2025-02-25 - [Privacy Shield and Secure Logging]
**Vulnerability:** Sensitive data leakage through App Switcher snapshots and technical details in system logs.
**Learning:** iOS captures snapshots of the app's UI for the App Switcher, which can expose sensitive user information. Additionally, using `error.localizedDescription` in logs can leak implementation details like file paths or database structure.
**Prevention:** Implement a Privacy Shield by monitoring `scenePhase` and applying a blur and overlay when the app is not active. Use `os.Logger` with `privacy: .private` for error objects to ensure sensitive details are redacted in production logs while remaining available for debugging.
