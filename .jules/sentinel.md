## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, simply setting file protection on the Application Support directory is not enough; SwiftData’s backing store file (or the URL passed into `ModelConfiguration`) itself must have `NSFileProtectionCompleteUntilFirstUserAuthentication` (or the desired protection class) applied to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. During initialization, ensure the SwiftData database file (or a pre-created URL used by `ModelConfiguration`) using the appropriate `fileProtectionKey` so that the data is actually stored with the desired file protection.

## 2025-02-25 - [Privacy Shield & Hardened Logging]
**Vulnerability:** Technical details leaking in system logs and sensitive data visible in the iOS App Switcher.
**Learning:** Default log interpolation can expose sensitive internal state or error messages to system logs. Additionally, the iOS App Switcher takes snapshots of the UI which can lead to sensitive data leakage.
**Prevention:** Use `privacy: .private` in `os.Logger` for sensitive data. Implement a Privacy Shield by observing `scenePhase` and applying a blur and overlay when the app is inactive to protect the UI in the App Switcher.
