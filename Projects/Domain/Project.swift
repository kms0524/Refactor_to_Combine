//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 강민성 on 2023/04/08.
//

import ProjectDescription
import ProjectDescriptionHelpers

import MyPlugin

let project = Project.makeModule(
    name: "Domain",
    product: .staticFramework,
    resourceSynthesizers: nil
)
