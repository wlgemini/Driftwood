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

    private weak var v1: UIView!
    private weak var v2: UIView!
    private weak var v3: UIView!
    private weak var v4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.v1 = self.view.createSubView()
        self.v1.dw.make.left(0).right(0).top(0).bottom(0, to: self.view.safeAreaLayoutGuide.dw.top)
        
        self.v2 = self.view.createSubView()
        self.v2.dw.make.left(0).right(0).top(0, to: self.view.safeAreaLayoutGuide.dw.bottom).bottom(0)
        
        self.v3 = self.view.createSubView()
        self.v3.dw.make.centerX(0).centerY(0).width(100).height(100)
        
        self.v4 = self.view.createSubView()
        self.v4.dw.make.centerX(50, to: self.v3.dw.centerX).centerY(50, to: self.v3.dw.centerY).width(100).height(100)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
