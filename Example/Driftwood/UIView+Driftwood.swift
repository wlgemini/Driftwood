//
//  UIView+Driftwood.swift
//  Driftwood
//
//  Created by wlgemini on 06/14/2018.
//  Copyright (c) 2018 wlgemini. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Create & Add & Return View
    func createSubView<T: UIView>() -> T? {
        let v = T()
        v.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(v)
        return v
    }
    
    /// Create & Add & Return LayoutGuide
    func createSubLayoutGuide() -> UILayoutGuide {
        let g = UILayoutGuide()
        self.addLayoutGuide(g)
        return g
    }
}
