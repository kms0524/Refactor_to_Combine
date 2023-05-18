//
//  InfoRepository.swift
//  FeatureModule
//
//  Created by 강민성 on 2023/04/08.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine

import ServiceModule

public class InfoRepository {
    private let networkService: InfoService
    
    public init(service: InfoService) {
        self.networkService = service
    }
}

extension InfoRepository {
    
}
