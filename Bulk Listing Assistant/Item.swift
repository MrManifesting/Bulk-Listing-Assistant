//
//  Item.swift
//  Bulk Listing Assistant
//
//  Created by Nick Kelley on 2/25/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    // BOLT OPTIMIZATION: Added index on timestamp to speed up sorted queries.
    // Estimated impact: Improves fetch performance from O(N log N) to O(log N) for large datasets.
    #Index([\.timestamp])

    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
