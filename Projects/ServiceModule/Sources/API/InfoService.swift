//
//  InfoService.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/04/08.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine

import Alamofire
import Moya

public typealias DefaultInfoService = BaseService<InfoAPI>

public protocol InfoService {
    func getInfos() -> AnyPublisher<InfoList?, Error>
}

extension DefaultInfoService: InfoService {
    public func getInfos() -> AnyPublisher<InfoList?, Error> {
        `default`.fetchData(.getInfos)
    }
    
    
}
