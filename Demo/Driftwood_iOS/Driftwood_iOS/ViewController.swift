//
//  ViewController.swift
//  Driftwood
//

import UIKit
import Driftwood

class ViewController: UIViewController {
    
    private weak var vTop: UIView!
    private weak var vBottom: UIView!
    
    private weak var vCenter: UIView!
    private weak var stkCenter: UIStackView!
    private weak var vCenter0: UIView!
    private weak var vCenter1: UIView!
    private weak var vCenter2: UIView!
    private weak var vLeading: UIView!
    private weak var vTrailing: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vTop = self.view.createSubView()
        self.vTop.dw.make(labeled: "Top").bottom(0, to: self.view.safeAreaLayoutGuide.dw.top).top(0).leading(0).trailing(0)
        
        self.vBottom = self.view.createSubView()
        self.vBottom.dw.make(labeled: "Bottom").top(0, to: self.view.safeAreaLayoutGuide.dw.bottom).bottom(0).leading(0).trailing(0)
        
        self.vCenter = self.view.createSubView()
        self.vCenter.dw.make().centerX(0).centerY(0)
        
        self.stkCenter = self.vCenter.createSubView()
        self.stkCenter.axis = .vertical
        self.stkCenter.alignment = .fill
        self.stkCenter.distribution = .fill
        self.stkCenter.dw.make(labeled: "Center").edge(insets: .zero).width(200)
        
        self.vCenter0 = self.stkCenter.createArrangedSubview()
        self.vCenter0.dw.make().height(100)
        
        self.vCenter1 = self.stkCenter.createArrangedSubview()
        self.vCenter1.dw.make().height(150)
        
        self.vCenter2 = self.stkCenter.createArrangedSubview()
        self.vCenter2.dw.make().height(200)
        
        self.vLeading = self.view.createSubView()
        self.vLeading.dw.make(labeled: "Leading").leading(0).trailing(0, to: self.stkCenter.dw.leading).centerY(0, to: self.stkCenter.dw.centerY).height(100)
        
        self.vTrailing = self.view.createSubView()
        self.vTrailing.dw.make(labeled: "Trailing").trailing(0).leading(0, to: self.stkCenter.dw.trailing).top(0, to: self.stkCenter.dw.top).height(100)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        self.vCenter0.isHidden = !self.vCenter0.isHidden
        self.vCenter1.isHidden = !self.vCenter0.isHidden
        self.vCenter2.isHidden = !self.vCenter0.isHidden
        self.vLeading.dw.update().height(150, priority: .defaultHigh)
        self.vTrailing.dw.update().height(200)
    }
}
