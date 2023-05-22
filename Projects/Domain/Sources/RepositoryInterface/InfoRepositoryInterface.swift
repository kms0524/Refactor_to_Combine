//
//  InfoRepositoryInterface.swift
//  Domain
//
//  Created by 강민성 on 2023/05/19.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine

import Network

public protocol InfoRepositoryInterface {
    func getInfo() -> AnyPublisher<[[InfoModel]]?, Error>
}
