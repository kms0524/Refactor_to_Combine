//
//  InfoRepository.swift
//  Data
//
//  Created by 강민성 on 2023/05/18.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine

import Core
import Domain
import Network

public class InfoRepository {
    private let networkService: InfoService
    private var cancelBag = CancelBag()
    
    public init(networkService: InfoService) {
        self.networkService = networkService
    }
    
}

extension InfoRepository: InfoRepositoryInterface {
    public func getInfo() -> AnyPublisher<[[InfoModel]]?, Error> {
        return mockResultEntity()
    }
}

extension InfoRepository {
    private func mockResultEntity() -> AnyPublisher<[[InfoModel]]?, Error> {
        networkService.getInfos()
            .map { $0 }
            .compactMap { $0?.toDomain() }
            .eraseToAnyPublisher()
        
    }
}
