//
//  Utils.swift
//  Driftwood
//

import UIKit

extension UIView {
    
    /// Create & Add & Return View
    func createSubView<T: UIView>() -> T? {
        let v = T()
        self.addSubview(v)
        let c = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 0.5)
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

extension UIStackView {
    
    /// Create & Add & Return View
    func createArrangedSubview<T: UIView>() -> T? {
        let v = T()
        self.addArrangedSubview(v)
        let c = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 0.5)
        v.backgroundColor = c
        return v
    }
}
