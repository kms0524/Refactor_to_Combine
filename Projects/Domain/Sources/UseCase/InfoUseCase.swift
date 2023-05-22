//
//  InfoUseCase.swift
//  Domain
//
//  Created by 강민성 on 2023/05/19.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine

import Core
import Network

public protocol InfoUseCase {
    func getInfo()
    var infoList: PassthroughSubject<[[InfoModel]], Error> { get set }
}

public class DefaultInfoUseCase {
    
    private let repository: InfoRepositoryInterface
    private var cancelBag = CancelBag()
    public var infoList = PassthroughSubject<[[InfoModel]], Error>()
    
    public init(repository: InfoRepositoryInterface) {
        self.repository = repository
    }
}

extension DefaultInfoUseCase: InfoUseCase {
    
    public func getInfo() {
        repository.getInfo()
            .sink(receiveCompletion: { event in
                print("completion: \(event)")
            }, receiveValue: { entity in
                guard let entity = entity else { return }
                self.infoList.send(entity)
            })
            .store(in: cancelBag)
    }
    
}
