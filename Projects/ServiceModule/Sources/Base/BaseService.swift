//
//  BaseService.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/04/06.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import Combine

public class BaseService<T: TargetType> {
    
    typealias API = T
    
    let session: Alamofire.Session = .default
    
    private let endPointClosure = { (target: API) -> Endpoint in
        let url = target.baseURL.appendingPathComponent(target.path).absoluteString
        var endpoint: Endpoint = Endpoint(
            url: url,
            sampleResponseClosure: {
                .networkResponse(200, target.sampleData)
            },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers)
        
        return endpoint
    }
    
    private lazy var provider: MoyaProvider<API> = {
        let provider = MoyaProvider<API>(endpointClosure: endPointClosure, session: session)
        
        return provider
    }()
    
    public init() {}
    
}

public extension BaseService {
    var `default`: BaseService {
        self.provider = self.provider
        return self
    }
}

extension BaseService {
    
    func fetchData<T: Decodable>(_ target: API) -> AnyPublisher<T?, Error> {
        return Future { promise in
            self.provider.request(target) { response in
                switch response {
                case .success(let value):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(T.self, from: value.data)
                        promise(.success(result))
                    } catch let error {
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
}
