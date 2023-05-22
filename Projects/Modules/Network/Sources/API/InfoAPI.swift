//
//  InfoAPI.swift
//  Network
//
//  Created by 강민성 on 2023/05/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import Foundation

import Alamofire
import Moya

public enum InfoAPI {
    case getInfo
}

extension InfoAPI: BaseAPI {
    public static var apiType: APIType = .info
    
    public var path: String {
        switch self {
        default: return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getInfo:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .getInfo:
            return .requestPlain
        }
    }
    
    public var smapleData: Data {
        switch self {
        case .getInfo:
            var lastWeekInfoListData = [
                InfoData(category: "Music", name: "Test1", count: "1번", favorite: "ON", backgroundColor: "BLACK")
            ]
            
            var todayInfoListData = [
                InfoData(category: "Movie", name: "Test2", count: "2번", favorite: "OFF", backgroundColor: "PURPLE")
            ]
            var thisWeekInfoListData = [
                InfoData(category: "Music", name: "Test3", count: "3번", favorite: "ON", backgroundColor: "BLACK")
            ]
            
            var nextWeekInfoListData = [
                InfoData(category: "Movie", name: "Test4", count: "4번", favorite: "OFF", backgroundColor: "PURPLE")
            ]
            
            let entity = InfoEntity(lastWeek: lastWeekInfoListData, today: todayInfoListData, thisWeek: thisWeekInfoListData, nextWeek: nextWeekInfoListData)
            
            if let data = try? JSONEncoder().encode(entity) {
                return data
            }
            else {
                return Data()
            }
        }
    }
    
    
}
