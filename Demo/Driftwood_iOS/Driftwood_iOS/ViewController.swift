//
//  ViewController.swift
//  Driftwood
//

import UIKit
import Driftwood

class ViewController: UIViewController {
    
    private weak var vTop: UIView!
    private weak var vBottom: UIView!
    private weak var stkCenter: UIStackView!
    private weak var vCenter0: UIView!
    private weak var vCenter1: UIView!
    private weak var vCenter2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vTop = self.view.createSubView()
        self.vTop.dw.make()
            .top(0)
            .leading(0)
            .trailing(0)
            .bottom(0, to: self.view.safeAreaLayoutGuide.dw.top)
        
        self.vBottom = self.view.createSubView()
        self.vBottom.dw.make()
            .bottom(0)
            .leading(0)
            .trailing(0)
            .top(0, to: self.view.safeAreaLayoutGuide.dw.bottom)

        
        self.stkCenter = self.view.createSubView()
        self.stkCenter.axis = .vertical
        self.stkCenter.alignment = .fill
        self.stkCenter.distribution = .fill
        self.stkCenter.dw
            .setContentCompressionResistanceVerticalPriority(.required)
            .setContentHuggingVerticalPriority(.required)
        self.stkCenter.dw.make(labeled: "Center")
            .centerX(0)
            .centerY(0)
            .width(100)
        
        self.vCenter0 = self.stkCenter.createArrangedSubview()
        self.vCenter0.dw.make()
            .height(50)
        
        self.vCenter1 = self.stkCenter.createArrangedSubview()
        self.vCenter1.dw.make()
            .height(100)
        
        self.vCenter2 = self.stkCenter.createArrangedSubview()
        self.vCenter2.dw.make()
            .height(150)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        self.stkCenter.dw.remake()
            .centerX(50, priority: UILayoutPriority.required.dw.lower)
            .centerY(100, priority: UILayoutPriority.required.dw.lower)
            .width(200, priority: UILayoutPriority.required.dw.lower)
    }
}
