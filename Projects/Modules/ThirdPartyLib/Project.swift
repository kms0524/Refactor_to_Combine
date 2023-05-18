//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/04/06.
//

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .framework,
    packages: [],
    dependencies: [
        .SPM.CombineCocoa,
        .SPM.Alamofire,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Reusable,
        .SPM.Moya
    ],
    resourceSynthesizers: .assets()
)
