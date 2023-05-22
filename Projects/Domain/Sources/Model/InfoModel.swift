//
//  InfoModel.swift
//  Domain
//
//  Created by 강민성 on 2023/05/18.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

public struct InfoModel {
    public let category, name, count, favtorite, backgroundColor: String
    
    public init(category: String, name: String, count: String, favtorite: String, backgroundColor: String) {
        self.category = category
        self.name = name
        self.count = count
        self.favtorite = favtorite
        self.backgroundColor = backgroundColor
    }
}
