//
//  InfoTransform.swift
//  Data
//
//  Created by 강민성 on 2023/05/18.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

import Domain
import Network

extension InfoEntity {
    public func toDomain() -> [[InfoModel]] {
        let lastWeek = self.lastWeek.map { entity in
            return InfoModel.init(category: entity.category, name: entity.name, count: entity.count, favtorite: entity.favorite, backgroundColor: entity.backgroundColor)
        }
        
        let today = self.today.map { entity in
            return InfoModel.init(category: entity.category, name: entity.name, count: entity.count, favtorite: entity.favorite, backgroundColor: entity.backgroundColor)
        }
        
        let thisWeek = self.thisWeek.map { entity in
            return InfoModel.init(category: entity.category, name: entity.name, count: entity.count, favtorite: entity.favorite, backgroundColor: entity.backgroundColor)
        }
        
        let nextWeek = self.nextWeek.map { entity in
            return InfoModel.init(category: entity.category, name: entity.name, count: entity.count, favtorite: entity.favorite, backgroundColor: entity.backgroundColor)
        }
        
        return [lastWeek, today, thisWeek, nextWeek]
        
    }
}
