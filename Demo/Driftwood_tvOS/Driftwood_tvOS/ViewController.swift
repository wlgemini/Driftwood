//
//  ViewController.swift
//  Driftwood_tvOS
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
        self.lb1.text = "1"
        self.lb1.textAlignment = .center
        self.lb1.dw.labeled("label1").make().left(0).right(0).top(0, to: self.view.safeAreaLayoutGuide.dw.top).height(50)
        
        self.lb2 = self.view.createSubView()
        self.lb2.text = "2"
        self.lb2.textAlignment = .center
        self.lb2.dw.labeled("label2").make().left(0).right(0).bottom(0, to: self.view.safeAreaLayoutGuide.dw.bottom).height(50)
        
        self.lb3 = self.view.createSubView()
        self.lb3.text = "3"
        self.lb3.textAlignment = .center
        self.lb3.dw.labeled("label3").make().centerXY(offsets: .zero).width(250).height(300)
        
        self.lb4 = self.view.createSubView()
        self.lb4.text = "4"
        self.lb4.textAlignment = .center
        self.lb4.dw.labeled("label4").make().centerXY(offsets: CGPoint(x: 50, y: 50), to: self.lb3).size(to: self.lb3)
        
        self.lb5 = self.view.createSubView()
        self.lb5.text = "5"
        self.lb5.textAlignment = .center
        self.lb5.dw.labeled("label5").make().edge(insets: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 30), to: self.lb4)
    }
}

