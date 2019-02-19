//
//  Utils.swift
//  Driftwood
//

import AppKit

extension NSView {
    
    /// Create & Add & Return View
    func createSubView<T: NSView>() -> T? {
        let v = T()
        v.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(v)
        return v
    }
    
    /// Create & Add & Return LayoutGuide
    func createSubLayoutGuide() -> NSLayoutGuide {
        let g = NSLayoutGuide()
        self.addLayoutGuide(g)
        return g
    }
}

extension NSColor {
    static var random: NSColor {
        return NSColor(deviceRed: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 0.5)
    }
}
