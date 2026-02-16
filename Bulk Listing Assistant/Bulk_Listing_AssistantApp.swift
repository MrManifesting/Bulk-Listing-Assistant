//
//  Bulk_Listing_AssistantApp.swift
//  Bulk Listing Assistant
//
//  Created by Nick Kelley on 2/25/25.
//

import SwiftUI
import SwiftData
import OSLog

@main
struct Bulk_Listing_AssistantApp: App {
    private static let logger = Logger(subsystem: "MrListerLLC.Bulk-Listing-Assistant", category: "Persistence")

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])

        do {
            // Enforce file protection on the Application Support directory and the store file to secure sensitive data.
            let fileManager = FileManager.default
            let appSupportURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

            var appSupportURLMutable = appSupportURL
            var resourceValues = URLResourceValues()
            resourceValues.fileProtectionKey = .completeUntilFirstUserAuthentication
            try appSupportURLMutable.setResourceValues(resourceValues)

            let storeURL = appSupportURL.appendingPathComponent("default.store")

            if !fileManager.fileExists(atPath: storeURL.path) {
                fileManager.createFile(atPath: storeURL.path, contents: nil, attributes: [.fileProtectionKey: FileProtectionType.completeUntilFirstUserAuthentication])
            } else {
                var storeURLMutable = storeURL
                var storeResourceValues = URLResourceValues()
                storeResourceValues.fileProtectionKey = .completeUntilFirstUserAuthentication
                try storeURLMutable.setResourceValues(storeResourceValues)
            }

            let modelConfiguration = ModelConfiguration(schema: schema, url: storeURL)
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            // Log the detailed error internally and fail with a generic message to avoid leaking details.
            Self.logger.error("Failed to initialize ModelContainer: \(error.localizedDescription)")
            fatalError("A critical error occurred while setting up the application storage.")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
