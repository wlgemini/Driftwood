//
//  ViewController.swift
//  Driftwood
//
//  Created by wlgemini on 06/14/2018.
//  Copyright (c) 2018 wlgemini. All rights reserved.
//

import UIKit
import Driftwood

class ViewController: UIViewController {

    private weak var gd: UILayoutGuide!
    private weak var lbL: UILabel!
    private weak var lbR: UILabel!
    private weak var lbT: UILabel!
    private weak var lbB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UILayoutGuide
        gd = self.view.createSubLayoutGuide()
        gd.dw.make.centerX(0).centerY(0).width(100).height(200)
        
        
        // Left
        lbL = self.view.createSubView()
        lbL.backgroundColor = .red
        lbL.dw.make.right(0, to: gd.dw.left).top(0, to: gd.dw.top).bottom(0, to: gd.dw.bottom).width(0, to: gd.dw.width)
        
        
        // Right
        lbR = self.view.createSubView()
        lbR.backgroundColor = .green
        lbR.dw.make.left(0, to: gd.dw.right).top(0, to: gd.dw.top).height(0, to: gd.dw.height).width(50)
        
        
        // Top
        lbT = self.view.createSubView()
        lbT.backgroundColor = .blue
        lbT.dw.make.bottom(0, to: gd.dw.top).centerX(0, to: gd.dw.centerX).width(100).height(50)
        
        
        // Bottom
        lbB = self.view.createSubView()
        lbB.backgroundColor = .purple
        lbB.dw.make.top(0, to: gd.dw.bottom).left(0, to: gd.dw.left).right(0, to: gd.dw.right).height(20)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        gd.dw.update.width(200).height(100)
        lbL.dw.remake.right(0, to: gd.dw.left).top(0, to: gd.dw.top).bottom(0, to: gd.dw.bottom).width(100)
        lbT.dw.remove.width()
        lbT.dw.make.width(0, to: gd.dw.width)
        lbR.dw.remake.left(0, to: gd.dw.right).centerY(0).width(50).height(50)
    }
}

