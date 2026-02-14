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
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            // Enforce file protection on the Application Support directory to secure sensitive data.
            let fileManager = FileManager.default
            let appSupportURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            var appSupportURLMutable = appSupportURL
            var resourceValues = URLResourceValues()
            resourceValues.fileProtectionKey = .completeUntilFirstUserAuthentication
            try appSupportURLMutable.setResourceValues(resourceValues)

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
