## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, simply setting file protection on the Application Support directory is not enough; SwiftData’s backing store file (or the URL passed into `ModelConfiguration`) itself must have `NSFileProtectionCompleteUntilFirstUserAuthentication` (or the desired protection class) applied to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. During initialization, ensure the SwiftData database file (or a pre-created URL used by `ModelConfiguration`) is created with the appropriate `fileProtectionKey` so that the data is actually stored with the desired file protection.

## 2026-02-28 - [App Switcher Snapshot Privacy]
**Vulnerability:** Sensitive information leakage through OS-level App Switcher snapshots.
**Learning:** iOS takes snapshots of the app's UI when it transitions to the background. These snapshots are stored and can be seen in the App Switcher, potentially exposing sensitive data.
**Prevention:** Use `@Environment(\.scenePhase)` to detect when the app is not active and apply a blur effect or an opaque overlay to the UI.
