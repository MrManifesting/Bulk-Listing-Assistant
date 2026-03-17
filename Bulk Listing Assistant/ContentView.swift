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
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            Group {
                if items.isEmpty {
                    ContentUnavailableView {
                        Label("Inventory", systemImage: "box.truck")
                    } description: {
                        Text("Your inventory is empty. Start by adding a new item.")
                    } actions: {
                        Button("Add Item", action: addItem)
                            .buttonStyle(.borderedProminent)
                    }
                } else {
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
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                if !items.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .help("Add a new item to your inventory")
                }
            }
        } detail: {
            ContentUnavailableView {
                Label("No Selection", systemImage: "list.bullet.circle")
            } description: {
                Text("Select an item from the inventory to view its details.")
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
