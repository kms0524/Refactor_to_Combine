//
//  InfoListEntity.swift
//  Network
//
//  Created by 강민성 on 2023/05/18.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public struct InfoEntity: Codable {
    public let lastWeek, today, thisWeek, nextWeek: [InfoData]
    
    public init(lastWeek: [InfoData], today: [InfoData], thisWeek: [InfoData], nextWeek: [InfoData]) {
        self.lastWeek = lastWeek
        self.today = today
        self.thisWeek = thisWeek
        self.nextWeek = nextWeek
        
    }
}

public struct InfoData: Codable {
    public let category, name, count, favorite, backgroundColor: String
    
    public init(category: String, name: String, count: String, favorite: String, backgroundColor: String) {
        self.category = category
        self.name = name
        self.count = count
        self.favorite = favorite
        self.backgroundColor = backgroundColor
    }
}
