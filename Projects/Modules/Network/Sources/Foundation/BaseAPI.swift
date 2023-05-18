//
//  BaseAPI.swift
//  Network
//
//  Created by 강민성 on 2023/05/16.
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
        var base = Config.Network.baseURL
        
        switch Self.apiType {
        case .info:
            base += "/infos"
        }
        
        guard let url = URL(string: base) else {
            fatalError()
        }
        return url
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
