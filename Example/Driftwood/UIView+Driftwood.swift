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
        let c = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        v.backgroundColor = c
        return v
    }
    
    /// Create & Add & Return LayoutGuide
    func createSubLayoutGuide() -> UILayoutGuide {
        let g = UILayoutGuide()
        self.addLayoutGuide(g)
        return g
    }
}
