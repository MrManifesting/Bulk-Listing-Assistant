## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, simply setting file protection on the Application Support directory is not enough; SwiftData’s backing store file (or the URL passed into `ModelConfiguration`) itself must have `NSFileProtectionCompleteUntilFirstUserAuthentication` (or the desired protection class) applied to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. During initialization, ensure the SwiftData database file (or a pre-created URL used by `ModelConfiguration`) is created with the appropriate `fileProtectionKey` so that the data is actually stored with the desired file protection.

## 2025-02-25 - [App Switcher Snapshot Protection]
**Vulnerability:** Potential leakage of sensitive business or inventory data through OS-level App Switcher snapshots.
**Learning:** System-generated screenshots for the App Switcher can capture sensitive information even if the data is protected at rest. Observing `@Environment(\.scenePhase)` allows the application to react to state transitions.
**Prevention:** Apply a `.blur` effect and an opaque `.overlay` (with a non-sensitive icon like `shield.fill`) to the main view whenever `scenePhase` is not `.active` to ensure that snapshots stored by the OS do not contain sensitive information.
