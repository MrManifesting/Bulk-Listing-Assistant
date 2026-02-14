## 2025-02-25 - [SwiftData Persistence Security]
**Vulnerability:** Information leakage through `fatalError` messages and lack of explicit file protection on local storage.
**Learning:** Default SwiftData templates often use `fatalError` with the raw error string, which can leak implementation details. Also, the Application Support directory should explicitly enforce `NSFileProtectionCompleteUntilFirstUserAuthentication` to ensure data is encrypted at rest on iOS.
**Prevention:** Always use generic messages in `fatalError` and log detailed errors via `os.Logger`. Programmatically set `fileProtectionKey` on the app's data directories during initialization.
