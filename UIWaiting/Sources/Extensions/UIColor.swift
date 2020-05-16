//
//  UIColor.swift
//  UIWatingViewController
//
//  Created by Cao Phuoc Thanh on 5/16/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

// MARK: - Color Builders
internal extension UIColor {

    func alpha(_ value: CGFloat) -> UIColor {
        return withAlphaComponent(value)
    }
    
}
