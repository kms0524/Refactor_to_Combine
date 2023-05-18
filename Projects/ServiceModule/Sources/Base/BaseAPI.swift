//
//  BaseAPI.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/04/06.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Alamofire
import Moya

public enum APIType {
    case info
}

public protocol BaseAPI: TargetType {
    static var apiType: APIType { get set }
}

extension BaseAPI {
    public var baseURL: URL {
        var base = "https://34f06a62-7d9a-4d15-a619-953556ad83f5.mock.pstmn.io/"
        
        switch Self.apiType {
        case .info:
            base += "infos"
        }
        
        guard let url = URL(string: base) else {
            fatalError()
        }
        
        return url
    }
    
    public var headers: [String : String]? {
        return ["Content-Type" : "Application/json"]
    }
}

public enum RequestParams {
    case requestPlain
}
