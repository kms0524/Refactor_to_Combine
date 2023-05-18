//
//  addSubViews.swift
//  Core
//
//  Created by 강민성 on 2023/05/16.
//  Copyright © 2023 kmskms.io. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubViews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
