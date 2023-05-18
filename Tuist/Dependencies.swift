//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/04/06.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
        .remote(url: "https://github.com/CombineCommunity/CombineCocoa.git", requirement: .upToNextMajor(from: "0.2.1"))
        ,
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.6.1"))
        ,
        .remote(
            url: "https://github.com/devxoul/Then.git",
            requirement: .upToNextMajor(from: "3.0.0.")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .package(
            url: "https://github.com/AliSoftware/Reusable.git",
            .upToNextMajor(from: "4.1.0")
        ),
        .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.0"))
    ],
    platforms: [.iOS]
)
