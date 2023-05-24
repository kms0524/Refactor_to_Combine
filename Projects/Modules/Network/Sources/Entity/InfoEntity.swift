//
//  InfoListEntity.swift
//  Network
//
//  Created by 강민성 on 2023/05/18.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public struct InfoEntity: Codable {
    public let infoList: InfoList
    
    public init(infoList: InfoList) {
        self.infoList = infoList
    }
}

public struct InfoList: Codable {
    public let lastWeek, today, thisWeek, nextWeek: [InfoListData]
    
    public init(lastWeek: [InfoListData], today: [InfoListData], thisWeek: [InfoListData], nextWeek: [InfoListData]) {
        self.lastWeek = lastWeek
        self.today = today
        self.thisWeek = thisWeek
        self.nextWeek = nextWeek
        
    }
}

public struct InfoListData: Codable {
    public let category, name, count, favorite, backgroundColor: String
    
    public init(category: String, name: String, count: String, favorite: String, backgroundColor: String) {
        self.category = category
        self.name = name
        self.count = count
        self.favorite = favorite
        self.backgroundColor = backgroundColor
    }
}
