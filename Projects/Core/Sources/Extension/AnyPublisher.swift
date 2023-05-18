//
//  AnyPublisher.swift
//  Core
//
//  Created by 강민성 on 2023/05/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Combine

public extension AnyPublisher {
    static func create<Output, Failure>(_ subscribe: @escaping (AnySubscriber<Output, Failure>) -> AnyCancellable) -> AnyPublisher<Output, Failure> {
        
        let passthroughSubject = PassthroughSubject<Output, Failure>()
        var cancellable: AnyCancellable?
        
        return passthroughSubject
            .handleEvents(receiveSubscription: { subscription in
                
                let subscriber = AnySubscriber<Output, Failure> { subscription in
                    
                } receiveValue: { input in
                    passthroughSubject.send(input)
                    return .unlimited
                } receiveCompletion: { completion in
                    passthroughSubject.send(completion: completion)
                }
                
                cancellable = subscribe(subscriber)
            }, receiveCompletion: { completion in
                
            }, receiveCancel: {
                cancellable?.cancel()
            })
            .eraseToAnyPublisher()
    }
}
