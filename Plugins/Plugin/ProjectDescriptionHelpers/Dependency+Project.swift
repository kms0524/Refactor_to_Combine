//
//  Dependency+Project.swift
//  MyPlugin
//
//  Created by 강민성 on 2023/04/06.
//

import ProjectDescription

extension TargetDependency {
    public enum Project {}
}

public extension TargetDependency.Project {
    static let FeatureModule = TargetDependency.project(target: "FeatureModule", path: .relativeToRoot("Projects/FeatureModule"))
    static let ServiceModule = TargetDependency.project(target: "ServiceModule", path: .relativeToRoot("Projects/ServiceModule"))
    static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", path: .relativeToRoot("Projects/Modules/ThirdPartyLib"))
    static let Domain = TargetDependency.project(target: "Domain", path: .relativeToRoot("Projects/Domain"))
    static let Data = TargetDependency.project(target: "Data", path: .relativeToRoot("Projects/Data"))
    static let Network = TargetDependency.project(target: "Network", path: .relativeToRoot("Projects/Modules/Network"))
    static let Presentation = TargetDependency.project(target: "Presentation", path: .relativeToRoot("Projects/Presentation"))
}

