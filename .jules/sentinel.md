## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, simply setting file protection on the Application Support directory is not enough; SwiftData’s backing store file (or the URL passed into `ModelConfiguration`) itself must have `NSFileProtectionCompleteUntilFirstUserAuthentication` (or the desired protection class) applied to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. During initialization, ensure the SwiftData database file (or a pre-created URL used by `ModelConfiguration`) is created with the appropriate `fileProtectionKey` so that the data is actually stored with the desired file protection.

## 2026-02-27 - [UI Snapshot Privacy Protection]
**Vulnerability:** Sensitive inventory data visible in the iOS App Switcher (snapshot leakage).
**Learning:** iOS automatically takes snapshots of the app's UI when it enters the background. If the app displays sensitive information, this data can be exposed in the App Switcher.
**Prevention:** Use `@Environment(\.scenePhase)` to detect when the app is moving to the background or is inactive, and apply a blur effect or a privacy overlay (e.g., a `ZStack` with a system background color and a generic icon) to hide the content before the snapshot is taken.
