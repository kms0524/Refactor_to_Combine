//
//  InfoAPI.swift
//  ServiceModule
//
//  Created by 강민성 on 2023/04/06.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

import Alamofire
import Moya

public enum InfoAPI {
    case getInfos
}

extension InfoAPI: BaseAPI {
    
    public static var apiType: APIType = .info
    
    public var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getInfos:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .getInfos:
            return .requestPlain
        }
    }
    
    
}
