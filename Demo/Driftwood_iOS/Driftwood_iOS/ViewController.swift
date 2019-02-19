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
    
    private weak var lb1: UILabel!
    private weak var lb2: UILabel!
    private weak var lb3: UILabel!
    private weak var lb4: UILabel!
    private weak var lb5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lb1 = self.view.createSubView()
        self.lb1.dw.make.width(500).left(0).right(0)
        
//        self.lb1 = self.view.createSubView()
//        self.lb1.text = "1"
//        self.lb1.textAlignment = .center
//        self.lb1.dw.make().left(0).right(0).top(0, to: self.view.safeAreaLayoutGuide.dw.top).height(50)
//
//        self.lb2 = self.view.createSubView()
//        self.lb2.text = "2"
//        self.lb2.textAlignment = .center
//        self.lb2.dw.make.left(0).right(0).bottom(0, to: self.view.safeAreaLayoutGuide.dw.bottom).height(50)
//
//        self.lb3 = self.view.createSubView()
//        self.lb3.text = "3"
//        self.lb3.textAlignment = .center
//        self.lb3.dw.make.centerXY(offsets: .zero).width(250).height(300)
//
//        self.lb4 = self.view.createSubView()
//        self.lb4.text = "4"
//        self.lb4.textAlignment = .center
//        self.lb4.dw.make.centerXY(offsets: CGPoint(x: 50, y: 50), to: self.lb3).size(to: self.lb3)
//
//        self.lb5 = self.view.createSubView()
//        self.lb5.text = "5"
//        self.lb5.textAlignment = .center
//        self.lb5.dw.make.edge(insets: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 30), to: self.lb4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        self.lb3.dw.update.centerXY(offsets: CGPoint(x: -50, y: -50))
//
//        self.lb4.dw.update.centerXY(offsets: CGPoint(x: 150, y: 150))
//        self.lb4.dw.remove.size()
//        self.lb4.dw.make.size(to: self.lb3, multiply: 0.75)
//
//        self.lb5.dw.update.edge(insets: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 0))
    }
}