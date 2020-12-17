//
//  ViewController.swift
//  Driftwood_macOS
//

import AppKit
import Driftwood

class ViewController: NSViewController {
    
    private weak var v1: NSButton!
    private weak var v2: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.dw.make().edge(insets: NSEdgeInsetsZero)
        self.v1 = self.view.createSubView()
        self.v1.bezelColor = NSColor.random
        self.v1.dw.make(labeled: "v1").centerX(0).centerY(0).width(50).height(100)
        
        self.v2 = self.view.createSubView()
        self.v1.bezelColor = NSColor.random
        self.v2.dw.make(labeled: "v2").top(10, to: self.v1.dw.bottom).centerX(0, to: self.v1.dw.centerX).width(100).height(to: self.v1.dw.width)
    }
}

