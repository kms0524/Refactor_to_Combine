//
//  BaseService.swift
//  Network
//
//  Created by 강민성 on 2023/05/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Combine
import Alamofire
import Moya

import Core

open class BaseService<Target: TargetType> {
    
    typealias API = Target
    
    var cancelBag = CancelBag()
    
    private lazy var provider = self.defaultProvider
    
    private let endpointClosure = { (target: API) -> Endpoint in
        let url = target.baseURL.appendingPathComponent(target.path).absoluteString
        var endpoint = Endpoint(url: url,
                                sampleResponseClosure: { .networkResponse(200, target.sampleData)},
                                method: target.method,
                                task: target.task,
                                httpHeaderFields: target.headers)
        return endpoint
    }
    
    private lazy var defaultProvider: MoyaProvider<API> = {
        let provider = MoyaProvider<API>(endpointClosure: endpointClosure, session: DefautlAlamofireManager.shared)
        return provider
    }()
    
    private lazy var testingProvider: MoyaProvider<API> = {
        let testingProvider = MoyaProvider<API>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub(_:))
        
        return testingProvider
    }()
}

public extension BaseService {
    var `default`: BaseService {
        self.provider = self.defaultProvider
        return self
    }
    
    var test: BaseService {
        self.provider = self.testingProvider
        return self
    }
}


extension BaseService {
    func requestObjectInCombine<T: Decodable>(_ target: API) -> AnyPublisher<T?, Error> {
        return Future { promise in
            self.provider.request(target) { response in
                switch response {
                case .success(let value):
                    do {
                        let decoder = JSONDecoder()
                        let body = try decoder.decode(T.self, from: value.data)
                        promise(.success(body))
                    }
                    catch let error {
                        dump(error)
                        promise(.failure(error))
                    }
                case .failure(let error):
                    dump(error)
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func requestObjectInCombineWithoutResult(_ target: API) -> AnyPublisher<Int, Error> {
        return Future { promise in
            self.provider.request(target) { response in
                switch response {
                case .success(let value):
                    promise(.success(value.statusCode))
                case .failure(let error):
                    dump(error)
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func requestObject<T: Decodable>(_ target: API, completion: @escaping (Result<T?, Error>) -> Void) {
        provider.request(target) { response in
            switch response {
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    let body = try decoder.decode(T.self, from: value.data)
                    completion(.success(body))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestObjectWithoutResult(_ target: API, completion: @escaping (Result<Int, Error>) -> Void) {
        provider.request(target) { response in
            switch response {
            case .success(let value):
                completion(.success(value.statusCode))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
