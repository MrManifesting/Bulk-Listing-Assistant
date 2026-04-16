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
    // BOLT OPTIMIZATION: Indexing the timestamp property significantly improves
    // sorting and retrieval performance as the data set grows.
    // Estimated impact: O(N) to O(log N) for indexed queries.
    #Index([\.timestamp])

    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
