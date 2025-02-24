//
//  Item.swift
//  LinCash
//
//  Created by Arn0 A on 2025/2/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
