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
    name: "RefactorToCombine",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.Data,
        .Project.Presentation
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist"),
    resourceSynthesizers: .assets()
)
