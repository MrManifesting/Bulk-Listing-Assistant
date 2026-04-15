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
    #Index([\.timestamp])
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
