//
//  ContentView.swift
//  Bulk Listing Assistant
//
//  Created by Nick Kelley on 2/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.scenePhase) private var scenePhase
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        // Apply a blur effect and an opaque overlay when the app is not active
        // to prevent sensitive information leakage in OS-level App Switcher snapshots.
        .blur(radius: scenePhase != .active ? 20 : 0)
        .overlay {
            if scenePhase != .active {
                #if os(iOS)
                Color(uiColor: .systemBackground)
                    .ignoresSafeArea()
                #elseif os(macOS)
                Color(nsColor: .windowBackgroundColor)
                    .ignoresSafeArea()
                #else
                Color.black
                    .ignoresSafeArea()
                #endif
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
