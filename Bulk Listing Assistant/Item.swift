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
    // BOLT OPTIMIZATION: Index on timestamp to speed up sorting and retrieval.
    // Estimated impact: O(N log N) to O(log N) for lookups and indexed sorting.
    #Index([\.timestamp])
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
