//
//  Dependency+SPM.swift
//  MyPlugin
//
//  Created by 강민성 on 2023/04/06.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let CombineCocoa = TargetDependency.external(name: "CombineCocoa")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let Then = TargetDependency.external(name: "Then")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Reusable = TargetDependency.external(name: "Reusable")
    static let Moya = TargetDependency.external(name: "Moya")
}
