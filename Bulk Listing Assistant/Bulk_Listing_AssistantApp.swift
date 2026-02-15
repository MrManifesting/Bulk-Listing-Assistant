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
            // Enforce file protection on the Application Support directory to secure sensitive data.
            let fileManager = FileManager.default
            let appSupportURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

            var appSupportURLMutable = appSupportURL
            var resourceValues = URLResourceValues()
            resourceValues.fileProtectionKey = .completeUntilFirstUserAuthentication
            try appSupportURLMutable.setResourceValues(resourceValues)

            // Explicitly define the store URL and ensure the file itself is protected.
            let storeURL = appSupportURL.appendingPathComponent("default.store")
            let modelConfiguration = ModelConfiguration(schema: schema, url: storeURL)

            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])

            // Apply protection to the store file itself to ensure it's secured as per Sentinel guidelines.
            var storeURLMutable = storeURL
            try storeURLMutable.setResourceValues(resourceValues)

            return container
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
