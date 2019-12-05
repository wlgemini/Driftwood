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
    private weak var vLeading: UIView!
    private weak var vTrailing: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vTop = self.view.createSubView()
        self.vTop.dw.make(labeled: "Top").bottom(0, to: self.view.safeAreaLayoutGuide.dw.top).top(0).leading(0).trailing(0)
        
        self.vBottom = self.view.createSubView()
        self.vBottom.dw.make(labeled: "Bottom").top(0, to: self.view.safeAreaLayoutGuide.dw.bottom).bottom(0).leading(0).trailing(0)
        
        self.vCenter = self.view.createSubView()
        self.vCenter.dw.make(labeled: "Center").centerXY(offsets: .zero).width(100).height(150)
        
        self.vLeading = self.view.createSubView()
        self.vLeading.dw.make(labeled: "Leading").leading(0).trailing(0, to: self.vCenter.dw.leading).centerY(0, to: self.vCenter.dw.centerY).height(100)
        
        self.vTrailing = self.view.createSubView()
        self.vTrailing.dw.make(labeled: "Trailing").trailing(0).leading(0, to: self.vCenter.dw.trailing).top(0, to: self.vCenter.dw.top).height(100)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        self.vCenter.dw.update().centerXY(offsets: CGPoint(x: 0, y: 100))
        self.vLeading.dw.update().height(150)
        self.vTrailing.dw.update().height(200)
    }
}
