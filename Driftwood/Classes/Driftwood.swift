//
//  Driftwood
//
//  Copyright (c) 2018-Present wlgemini <wangluguang@live.com>.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit


/// DriftwoodBase
public protocol DriftwoodBase: class {
    
    /// superview
    var superview: UIView? { get }
    
    /// description
    var description: String { get }
}


/// UIView+DriftwoodBase
extension UIView: DriftwoodBase {}


/// UILayoutGuide+DriftwoodBase
@available(iOS 9.0, *)
extension UILayoutGuide: DriftwoodBase {
    
    /// superview
    public var superview: UIView? { return self.owningView }
}

/// Attribute
private typealias Attribute = NSLayoutConstraint.Attribute


/// Relation
public typealias Relation = NSLayoutConstraint.Relation


/// Priority
public typealias Priority = UILayoutPriority


/// Horizontal attribute
public enum AttributeX {
    
    case superviewX
    
    case left(base: DriftwoodBase)
    
    case right(base: DriftwoodBase)
    
    case leading(base: DriftwoodBase)
    
    case trailing(base: DriftwoodBase)
    
    case centerX(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case leftMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case rightMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case leadingMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case trailingMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case centerXWithinMargins(base: DriftwoodBase)
}


/// Vertical attribute
public enum AttributeY {
    
    case superviewY
    
    case top(base: DriftwoodBase)
    
    case bottom(base: DriftwoodBase)
    
    case centerY(base: DriftwoodBase)
    
    case lastBaseline(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case firstBaseline(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case topMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case bottomMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case centerYWithinMargins(base: DriftwoodBase)
}


/// Size attribute
public enum AttributeSize {
    
    case width(base: DriftwoodBase)
    
    case height(base: DriftwoodBase)
}


/// Constraint Maker
public struct ConstraintMaker {
    
    //===========================================
    // Make AttributeX
    //===========================================
    //
    /// left to superview
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .left, constant: constant, by: relation, priority: priority)
    }
    
    /// left
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .left, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// right to superview
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .right, constant: constant, by: relation, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .right, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leading to superview
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .leading, constant: constant, by: relation, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .leading, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// trailing to superview
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .trailing, constant: constant, by: relation, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .trailing, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerX to superview
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .centerX, constant: constant, by: relation, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .centerX, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leftMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .leftMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .leftMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// rightMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .rightMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .rightMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leadingMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .leadingMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .leadingMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// trailingMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .trailingMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .trailingMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerXWithinMargins to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeXToSuperview(for: .centerXWithinMargins, constant: constant, by: relation, priority: priority)
    }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .centerXWithinMargins, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    //===========================================
    // Make AttributeY
    //===========================================
    //
    /// top to superview
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .top, constant: constant, by: relation, priority: priority)
    }
    
    /// top
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .top, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// bottom to superview
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .bottom, constant: constant, by: relation, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .bottom, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerY to superview
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .centerY, constant: constant, by: relation, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .centerY, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// lastBaseline to superview
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .lastBaseline, constant: constant, by: relation, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .lastBaseline, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// firstBaseline to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .firstBaseline, constant: constant, by: relation, priority: priority)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .firstBaseline, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// topMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .topMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .topMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// bottomMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .bottomMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .bottomMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerYWithinMargins to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self._makeYToSuperview(for: .centerYWithinMargins, constant: constant, by: relation, priority: priority)
    }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .centerYWithinMargins, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    //===========================================
    // Make AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeSize? = nil, multiply: CGFloat = 1, priority: Priority = .required) -> ConstraintMaker {
        return self._makeSize(for: .width, constant: constant, by: relation, to: attribute, multiply: multiply, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeSize? = nil, multiply: CGFloat = 1, priority: Priority = .required) -> ConstraintMaker {
        return self._makeSize(for: .height, constant: constant, by: relation, to: attribute, multiply: multiply, priority: priority)
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// driftwood
    private let _driftwood: Driftwood
    
    /// Init
    fileprivate init(driftwood: Driftwood) {
        self._driftwood = driftwood
    }
    
    /// make attribute X to superview
    private func _makeXToSuperview(for attribute: Attribute, constant: CGFloat, by relation: Relation, priority: Priority) -> ConstraintMaker {
        return self._makeX(for: attribute, constant: constant, by: relation, to: .superviewX, priority: priority)
    }
    
    /// make attribute X
    private func _makeX(for attribute: Attribute, constant: CGFloat, by relation: Relation, to attributeX: AttributeX, priority: Priority) -> ConstraintMaker {
        // check if attribute belong to X-axis.
        switch attribute {
        case .left, .right, .leading, .trailing, .centerX, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins: break
        default: fatalError("Driftwood ConstraintMaker Error: attribute \(attribute) is not belong to X-axis!")
        }
        
        // check if there was an attribute already installed.
        guard nil == self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) already have \(attribute) constraint!")
        }
        
        // retrieve item from AttributeX
        let attrX: Attribute
        let toItem: DriftwoodBase
        
        switch attributeX {
        case .superviewX:
            // check if there is an superview
            guard let superview = self._driftwood._base.superview else {
                fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) have no superview!")
            }
            attrX = attribute
            toItem = superview
            
        case .left(base: let item):
            attrX = .left
            toItem = item
            
        case .right(base: let item):
            attrX = .right
            toItem = item
            
        case .leading(base: let item):
            attrX = .leading
            toItem = item
            
        case .trailing(base: let item):
            attrX = .trailing
            toItem = item
            
        case .centerX(base: let item):
            attrX = .centerX
            toItem = item
            
        case .leftMargin(base: let item):
            attrX = .leftMargin
            toItem = item
            
        case .rightMargin(base: let item):
            attrX = .rightMargin
            toItem = item
            
        case .leadingMargin(base: let item):
            attrX = .leadingMargin
            toItem = item
            
        case .trailingMargin(base: let item):
            attrX = .trailingMargin
            toItem = item
            
        case .centerXWithinMargins(base: let item):
            attrX = .centerXWithinMargins
            toItem = item
        }
        
        // install constraint
        let con = NSLayoutConstraint(item: self._driftwood._base, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: attrX, multiplier: 1, constant: constant)
        con.priority = priority
        con.isActive = true
        self._driftwood._constraintsWapper.constraints[attribute] = con
        return self
    }
    
    /// make attribute Y to superview
    private func _makeYToSuperview(for attribute: Attribute, constant: CGFloat, by relation: Relation, priority: Priority) -> ConstraintMaker {
        return self._makeY(for: attribute, constant: constant, by: relation, to: .superviewY, priority: priority)
    }
    
    /// make attribute Y
    private func _makeY(for attribute: Attribute, constant: CGFloat, by relation: Relation, to attributeY: AttributeY, priority: Priority) -> ConstraintMaker {
        // check if attribute belong to Y-axis.
        switch attribute {
        case .top, .bottom, .centerY, .lastBaseline, .firstBaseline, .topMargin, .bottomMargin, .centerYWithinMargins: break
        default: fatalError("Driftwood ConstraintMaker Error: attribute \(attribute) is not belong to Y-axis!")
        }
        
        // check if there was an attribute already installed.
        guard nil == self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) already have \(attribute) constraint!")
        }
        
        // retrieve item from AttributeY
        let attrY: Attribute
        let toItem: DriftwoodBase
        
        switch attributeY {
        case .superviewY:
            // check if there is an superview or not
            guard let superview = self._driftwood._base.superview else {
                fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) have no superview!")
            }
            attrY = attribute
            toItem = superview
            
        case .top(base: let item):
            attrY = .top
            toItem = item
            
        case .bottom(base: let item):
            attrY = .bottom
            toItem = item
            
        case .centerY(base: let item):
            attrY = .centerY
            toItem = item
            
        case .lastBaseline(base: let item):
            attrY = .lastBaseline
            toItem = item
            
        case .firstBaseline(base: let item):
            attrY = .firstBaseline
            toItem = item
            
        case .topMargin(base: let item):
            attrY = .topMargin
            toItem = item
            
        case .bottomMargin(base: let item):
            attrY = .bottomMargin
            toItem = item
            
        case .centerYWithinMargins(base: let item):
            attrY = .centerYWithinMargins
            toItem = item
        }
        
        // install constraint
        let con = NSLayoutConstraint(item: self._driftwood._base, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: attrY, multiplier: 1, constant: constant)
        con.priority = priority
        con.isActive = true
        self._driftwood._constraintsWapper.constraints[attribute] = con
        return self
    }
    
    /// make attribute Size
    private func _makeSize(for attribute: Attribute, constant: CGFloat, by relation: Relation, to attributeSize: AttributeSize?, multiply: CGFloat, priority: Priority) -> ConstraintMaker {
        // check if attribute belong to size.
        switch attribute {
        case .width, .height: break
        default: fatalError("Driftwood ConstraintMaker Error: attribute \(attribute) is not belong to size!")
        }
        
        // check if there was an attribute already installed.
        guard nil == self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) already have \(attribute) constraint!")
        }
        
        // retrieve item from AttributeSize
        var attrSize: Attribute?
        var toItem: DriftwoodBase?
        
        if let _attributeSize = attributeSize {
            switch _attributeSize {
            case .width(base: let item):
                attrSize = .width
                toItem = item
                
            case .height(base: let item):
                attrSize = .height
                toItem = item
            }
        }
        
        // install constraint
        let con = NSLayoutConstraint(item: self._driftwood._base, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: attrSize ?? .notAnAttribute, multiplier: multiply, constant: constant)
        con.priority = priority
        con.isActive = true
        self._driftwood._constraintsWapper.constraints[attribute] = con
        return self
    }
}


/// Constraint Updater
public struct ConstraintUpdater {
    
    //===========================================
    // Update AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .left, constant: constant, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .right, constant: constant, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .leading, constant: constant, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .trailing, constant: constant, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .centerX, constant: constant, priority: priority)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .leftMargin, constant: constant, priority: priority)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .rightMargin, constant: constant, priority: priority)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .leadingMargin, constant: constant, priority: priority)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .trailingMargin, constant: constant, priority: priority)
    }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .centerXWithinMargins, constant: constant, priority: priority)
    }
    
    //===========================================
    // Update AttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .top, constant: constant, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .bottom, constant: constant, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .centerY, constant: constant, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .lastBaseline, constant: constant, priority: priority)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .firstBaseline, constant: constant, priority: priority)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .topMargin, constant: constant, priority: priority)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .bottomMargin, constant: constant, priority: priority)
    }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .centerYWithinMargins, constant: constant, priority: priority)
    }
    
    //===========================================
    // Update AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .width, constant: constant, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat? = nil, priority: Priority? = nil) -> ConstraintUpdater {
        return self._update(for: .height, constant: constant, priority: priority)
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// driftwood
    private let _driftwood: Driftwood
    
    /// Init
    fileprivate init(driftwood: Driftwood) {
        self._driftwood = driftwood
    }
    
    /// update attribute
    private func _update(for attribute: Attribute, constant: CGFloat?, priority: Priority?) -> ConstraintUpdater {
        guard let con = self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintUpdater Error: \(self._driftwood._base.description) have no \(attribute) constraint!")
        }
        
        if let _constant = constant { con.constant = _constant }
        if let _priority = priority { con.priority = _priority }
        return self
    }
}


/// Constraint Remover
public struct ConstraintRemover {
    
    //===========================================
    // Remove AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left() -> ConstraintRemover {
        return self._remove(for: .left)
    }
    
    /// right
    @discardableResult
    public func right() -> ConstraintRemover {
        return self._remove(for: .right)
    }
    
    /// leading
    @discardableResult
    public func leading() -> ConstraintRemover {
        return self._remove(for: .leading)
    }
    
    /// trailing
    @discardableResult
    public func trailing() -> ConstraintRemover {
        return self._remove(for: .trailing)
    }
    
    /// centerX
    @discardableResult
    public func centerX() -> ConstraintRemover {
        return self._remove(for: .centerX)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin() -> ConstraintRemover {
        return self._remove(for: .leftMargin)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin() -> ConstraintRemover {
        return self._remove(for: .rightMargin)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin() -> ConstraintRemover {
        return self._remove(for: .leadingMargin)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin() -> ConstraintRemover {
        return self._remove(for: .trailingMargin)
    }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins() -> ConstraintRemover {
        return self._remove(for: .centerXWithinMargins)
    }
    
    //===========================================
    // Remove AttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top() -> ConstraintRemover {
        return self._remove(for: .top)
    }
    
    /// bottom
    @discardableResult
    public func bottom() -> ConstraintRemover {
        return self._remove(for: .bottom)
    }
    
    /// centerY
    @discardableResult
    public func centerY() -> ConstraintRemover {
        return self._remove(for: .centerY)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline() -> ConstraintRemover {
        return self._remove(for: .lastBaseline)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline() -> ConstraintRemover {
        return self._remove(for: .firstBaseline)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin() -> ConstraintRemover {
        return self._remove(for: .topMargin)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin() -> ConstraintRemover {
        return self._remove(for: .bottomMargin)
    }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins() -> ConstraintRemover {
        return self._remove(for: .centerYWithinMargins)
    }
    
    //===========================================
    // Remove AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width() -> ConstraintRemover {
        return self._remove(for: .width)
    }
    
    /// height
    @discardableResult
    public func height() -> ConstraintRemover {
        return self._remove(for: .height)
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// driftwood
    private let _driftwood: Driftwood
    
    /// Init
    fileprivate init(driftwood: Driftwood) {
        self._driftwood = driftwood
    }
    
    /// remove attribute
    private func _remove(for attribute: Attribute) -> ConstraintRemover {
        guard let con = self._driftwood._constraintsWapper.constraints.removeValue(forKey: attribute) else {
            fatalError("Driftwood ConstraintRemover Error: \(self._driftwood._base.description) have no \(attribute) constraint !!!")
        }
        
        con.isActive = false
        return self
    }
}


/// Driftwood
public struct Driftwood {
    
    //===========================================
    // Make, Update, Remove, Remake Constraint
    //===========================================
    //
    /// make
    public var make: ConstraintMaker {
        return ConstraintMaker(driftwood: self)
    }
    
    /// update
    public var update: ConstraintUpdater {
        return ConstraintUpdater(driftwood: self)
    }
    
    /// remove
    public var remove: ConstraintRemover {
        return ConstraintRemover(driftwood: self)
    }
    
    /// remake
    public var remake: ConstraintMaker {
        // remove all constraints from superview
        self._constraintsWapper.constraints.values.forEach({ $0.isActive = false })
        self._constraintsWapper.constraints = [:]
        return ConstraintMaker(driftwood: self)
    }
    
    //===========================================
    // AttributeX
    //===========================================
    //
    /// left
    public var left: AttributeX { return .left(base: _base) }
    
    /// right
    public var right: AttributeX { return .right(base: _base) }
    
    /// leading
    public var leading: AttributeX { return .leading(base: _base) }
    
    /// trailing
    public var trailing: AttributeX { return .trailing(base: _base) }
    
    /// centerX
    public var centerX: AttributeX { return .centerX(base: _base) }
    
    /// leftMargin
    @available(iOS 8.0, *)
    public var leftMargin: AttributeX { return .leftMargin(base: _base) }
    
    /// rightMargin
    @available(iOS 8.0, *)
    public var rightMargin: AttributeX { return .rightMargin(base: _base) }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    public var leadingMargin: AttributeX { return .leadingMargin(base: _base) }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    public var trailingMargin: AttributeX { return .trailingMargin(base: _base) }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    public var centerXWithinMargins: AttributeX { return .centerXWithinMargins(base: _base) }
    
    //===========================================
    // AttributeY
    //===========================================
    //
    /// top
    public var top: AttributeY { return .top(base: _base) }
    
    /// bottom
    public var bottom: AttributeY { return .bottom(base: _base) }
    
    /// centerY
    public var centerY: AttributeY { return .centerY(base: _base) }
    
    /// lastBaseline
    public var lastBaseline: AttributeY { return .lastBaseline(base: _base) }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    public var firstBaseline: AttributeY { return .firstBaseline(base: _base) }
    
    /// topMargin
    @available(iOS 8.0, *)
    public var topMargin: AttributeY { return .topMargin(base: _base) }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    public var bottomMargin: AttributeY { return .bottomMargin(base: _base) }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    public var centerYWithinMargins: AttributeY { return .centerYWithinMargins(base: _base) }
    
    //===========================================
    // AttributeSize
    //===========================================
    //
    /// width
    public var width: AttributeSize { return .width(base: _base) }
    
    /// height
    public var height: AttributeSize { return .height(base: _base) }
    
    //===========================================
    // Private
    //===========================================
    //
    /// _ConstraintsWrapper
    fileprivate class _ConstraintsWrapper {
        var constraints: [Attribute: NSLayoutConstraint] = [:]
    }
    
    /// init
    fileprivate init(base: DriftwoodBase) { _base = base }
    
    /// base view
    fileprivate let _base: DriftwoodBase
    
    // constraints wrapper
    fileprivate var _constraintsWapper: _ConstraintsWrapper {
        if let cw = objc_getAssociatedObject(self._base, &_constraintsWapperKey) as? _ConstraintsWrapper {
            return cw
        } else {
            let cw = _ConstraintsWrapper()
            objc_setAssociatedObject(self._base, &_constraintsWapperKey, cw, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return cw
        }
    }
}


/// UIView+Driftwood
extension UIView {
    
    /// driftwood
    public var dw: Driftwood { return Driftwood(base: self) }
}


/// UILayoutGuide+Driftwood
@available(iOS 9.0, *)
extension UILayoutGuide {
    
    /// driftwood
    public var dw: Driftwood { return Driftwood(base: self) }
}


/// _constraintsWapper Key
private var _constraintsWapperKey: Void?

