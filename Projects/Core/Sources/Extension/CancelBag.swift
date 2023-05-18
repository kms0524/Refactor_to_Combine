//
//  CancelBag.swift
//  Core
//
//  Created by 강민성 on 2023/05/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Combine

open class CancelBag {
    public var subscription = Set<AnyCancellable>()
    
    public func cancel() {
        subscription.forEach { $0.cancel() }
        subscription.removeAll()
    }
    
    public init() {}
}

extension AnyCancellable {
    public func store(in cancelBag: CancelBag) {
        cancelBag.subscription.insert(self)
    }
}
