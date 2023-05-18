//
//  AFManager.swift
//  Network
//
//  Created by 강민성 on 2023/05/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation
import Alamofire

public class DefautlAlamofireManager: Alamofire.Session {
    static let shared: DefautlAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 5
        configuration.timeoutIntervalForResource = 5
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        
        return DefautlAlamofireManager(configuration: configuration)
    }()
}
