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
    private weak var v5: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.v1 = self.view.createSubView()
        self.v1.dw.make.left(0).right(0).top(0).bottom(0, to: self.view.safeAreaLayoutGuide.dw.top)
        
        self.v2 = self.view.createSubView()
        self.v2.dw.make.left(0).right(0).top(0, to: self.view.safeAreaLayoutGuide.dw.bottom).bottom(0)
        
        self.v3 = self.view.createSubView()
        self.v3.dw.make.centerX(0).centerY(0).width(200).height(300)

        
        self.v4 = self.view.createSubView()
        self.v4.dw.make.centerXY(offsets: CGPoint(x: 50, y: 50)).size(to: self.v3)
        
        self.v5 = self.view.createSubView()
        self.v5.dw.make.edge(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), to: self.v4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
