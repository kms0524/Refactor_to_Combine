//
//  InfoService.swift
//  Network
//
//  Created by 강민성 on 2023/05/18.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine
import Alamofire
import Moya

public typealias DefaultInfoService = BaseService<InfoAPI>

public protocol InfoService {
    func getInfos() -> AnyPublisher<InfoListEntity?, Error>
}

extension DefaultInfoService: InfoService {
    public func getInfos() -> AnyPublisher<InfoListEntity?, Error> {
        return test.requestObjectInCombine(.getInfo)
    }
}
