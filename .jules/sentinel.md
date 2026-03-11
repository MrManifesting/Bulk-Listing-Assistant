## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, simply setting file protection on the Application Support directory is not enough; SwiftData’s backing store file (or the URL passed into `ModelConfiguration`) itself must have `NSFileProtectionCompleteUntilFirstUserAuthentication` (or the desired protection class) applied to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. During initialization, ensure the SwiftData database file (or a pre-created URL used by `ModelConfiguration`) is created with the appropriate `fileProtectionKey` so that the data is actually stored with the desired file protection.

## 2026-03-11 - [App Switcher Information Leakage]
**Vulnerability:** Sensitive application data may be visible in system-generated snapshots (e.g., iOS App Switcher or macOS Mission Control) when the app is in the background or inactive.
**Learning:** System snapshots can capture and display sensitive user data from the app's UI even when it's not the active application. Observing `@Environment(\.scenePhase)` allows the app to dynamically respond to state changes.
**Prevention:** Implement a "privacy shield" by applying a `.blur` effect and an opaque `.overlay` to the root view when `scenePhase` is not `.active`. This ensures that snapshots captured by the OS do not reveal user data.
