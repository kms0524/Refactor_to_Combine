//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/05/16.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Data",
    product: .staticFramework,
    dependencies: [
        .Project.Network,
        .Project.Domain
    ],
    resourceSynthesizers: nil)
