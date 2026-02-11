//
//  Bulk_Listing_AssistantApp.swift
//  Bulk Listing Assistant
//
//  Created by Nick Kelley on 2/25/25.
//

import SwiftUI
import SwiftData
import Foundation
import os

@main
struct Bulk_Listing_AssistantApp: App {
    private static let logger = Logger(subsystem: "MrListerLLC.Bulk-Listing-Assistant", category: "Persistence")

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        // Security: Ensure the database directory has appropriate file protection
        let fileManager = FileManager.default
        if let appSupportURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first {
            do {
                try fileManager.createDirectory(at: appSupportURL, withIntermediateDirectories: true)
                try fileManager.setAttributes([.protectionKey: FileProtectionType.completeUntilFirstUserAuthentication], ofItemAtPath: appSupportURL.path)
            } catch {
                // Log the error securely without failing the app, as the system default might still be safe
                logger.error("Security: Failed to set file protection: \(error.localizedDescription, privacy: .public)")
            }
        }

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            // Security: Use os.Logger to record the technical error details securely
            logger.critical("Persistence: Failed to create ModelContainer: \(error.localizedDescription, privacy: .public)")
            // Security: Generic error message to prevent information leakage in crash reports
            fatalError("Failed to initialize data storage.")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
