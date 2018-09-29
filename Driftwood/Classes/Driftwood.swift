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


/// DriftwoodItem
public protocol DriftwoodItem: class {
    
    /// superview
    var superview: UIView? { get }
    
    /// description
    var description: String { get }
    
    /// hashValue
    var hashValue: Int { get }
}


/// UIView+DriftwoodItem
extension UIView: DriftwoodItem {}


/// UILayoutGuide+DriftwoodItem
@available(iOS 9.0, *)
extension UILayoutGuide: DriftwoodItem {
    
    /// superview
    public var superview: UIView? { return self.owningView }
}


/// Relation
public typealias Relation = NSLayoutConstraint.Relation


/// Priority
public typealias Priority = UILayoutPriority


/// Horizontal attribute
public enum AttributeX {
    
    case superviewX
    
    case left(DriftwoodItem)
    
    case right(DriftwoodItem)
    
    case leading(DriftwoodItem)
    
    case trailing(DriftwoodItem)
    
    case centerX(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case leftMargin(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case rightMargin(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case leadingMargin(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case trailingMargin(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case centerXWithinMargins(DriftwoodItem)
}


/// Vertical attribute
public enum AttributeY {
    
    case superviewY
    
    case top(DriftwoodItem)
    
    case bottom(DriftwoodItem)
    
    case centerY(DriftwoodItem)
    
    case lastBaseline(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case firstBaseline(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case topMargin(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case bottomMargin(DriftwoodItem)
    
    @available(iOS 8.0, *)
    case centerYWithinMargins(DriftwoodItem)
}


/// Size attribute
public enum AttributeSize {
    
    case width(DriftwoodItem)
    
    case height(DriftwoodItem)
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
    /// _item
    private let _item: DriftwoodItem
    
    /// init
    fileprivate init(item: DriftwoodItem) {
        self._item = item
    }
    
    /// make X-axis's constraint to superview
    private func _makeXToSuperview(for attribute: _Attribute, constant: CGFloat, by relation: Relation, priority: Priority) -> ConstraintMaker {
        return self._makeX(for: attribute, constant: constant, by: relation, to: .superviewX, priority: priority)
    }
    
    /// make X-axis's constraint
    private func _makeX(for attribute: _Attribute, constant: CGFloat, by relation: Relation, to attributeX: AttributeX, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to X-axis.
        switch attribute {
        case .left, .right, .leading, .trailing, .centerX, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins: break
        default: fatalError("Driftwood ConstraintMaker Error: attribute \(attribute) is not belong to X-axis!")
        }
        
        // 1. check if there was an constraint already installed by driftwood
        guard nil == self._item._constraintsWapper.activeConstraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._item.description) already have \(attribute) constraint!")
        }
        
        // 2. retrieve (toItem & toAttribute) from AttributeX
        let toAttribute: _Attribute
        let toItem: DriftwoodItem
        switch attributeX {
        case .superviewX:
            // check if there is an superview
            guard let superview = self._item.superview else {
                fatalError("Driftwood ConstraintMaker Error: \(self._item.description) have no superview!")
            }
            toAttribute = attribute
            toItem = superview
            
        case .left(let item):
            toAttribute = .left
            toItem = item
            
        case .right(let item):
            toAttribute = .right
            toItem = item
            
        case .leading(let item):
            toAttribute = .leading
            toItem = item
            
        case .trailing(let item):
            toAttribute = .trailing
            toItem = item
            
        case .centerX(let item):
            toAttribute = .centerX
            toItem = item
            
        case .leftMargin(let item):
            toAttribute = .leftMargin
            toItem = item
            
        case .rightMargin(let item):
            toAttribute = .rightMargin
            toItem = item
            
        case .leadingMargin(let item):
            toAttribute = .leadingMargin
            toItem = item
            
        case .trailingMargin(let item):
            toAttribute = .trailingMargin
            toItem = item
            
        case .centerXWithinMargins(let item):
            toAttribute = .centerXWithinMargins
            toItem = item
        }
        
        // 3. generate a _ConstraintKey
        let conKey = _ConstraintKey(attribute: attribute, toItemHashValue: toItem.hashValue, toAttribute: toAttribute, relation: relation, multiply: 1)
        
        // 4. retrive an constraint from cache, if any
        let con: NSLayoutConstraint
        if let c = self._item._constraintsWapper.deactiveConstraints.removeValue(forKey: conKey.hashValue) {
            // 4.1 have cached
            con = c
            con.constant = constant
            con.priority = priority
        } else {
            // 4.2 not cache
            con = NSLayoutConstraint(item: self._item, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: toAttribute, multiplier: 1, constant: constant)
            con.priority = priority
        }
        
        // 5. install constraint
        con.isActive = true
        self._item._constraintsWapper.activeConstraints[attribute] = con
        
        // 6. return self
        return self
    }
    
    /// make Y-axis's constraint to superview
    private func _makeYToSuperview(for attribute: _Attribute, constant: CGFloat, by relation: Relation, priority: Priority) -> ConstraintMaker {
        return self._makeY(for: attribute, constant: constant, by: relation, to: .superviewY, priority: priority)
    }
    
    /// make Y-axis's constraint
    private func _makeY(for attribute: _Attribute, constant: CGFloat, by relation: Relation, to attributeY: AttributeY, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to Y-axis.
        switch attribute {
        case .top, .bottom, .centerY, .lastBaseline, .firstBaseline, .topMargin, .bottomMargin, .centerYWithinMargins: break
        default: fatalError("Driftwood ConstraintMaker Error: attribute \(attribute) is not belong to Y-axis!")
        }
        
        // 1. check if there was an constraint already installed by driftwood
        guard nil == self._item._constraintsWapper.activeConstraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._item.description) already have \(attribute) constraint!")
        }
        
        // 2. retrieve (toItem & toAttribute) from AttributeY
        let toAttribute: _Attribute
        let toItem: DriftwoodItem
        switch attributeY {
        case .superviewY:
            // check if there is an superview
            guard let superview = self._item.superview else {
                fatalError("Driftwood ConstraintMaker Error: \(self._item.description) have no superview!")
            }
            toAttribute = attribute
            toItem = superview
            
        case .top(let item):
            toAttribute = .top
            toItem = item
            
        case .bottom(let item):
            toAttribute = .bottom
            toItem = item
            
        case .centerY(let item):
            toAttribute = .centerY
            toItem = item
            
        case .lastBaseline(let item):
            toAttribute = .lastBaseline
            toItem = item
            
        case .firstBaseline(let item):
            toAttribute = .firstBaseline
            toItem = item
            
        case .topMargin(let item):
            toAttribute = .topMargin
            toItem = item
            
        case .bottomMargin(let item):
            toAttribute = .bottomMargin
            toItem = item
            
        case .centerYWithinMargins(let item):
            toAttribute = .centerYWithinMargins
            toItem = item
        }
        
        // 3. generate a _ConstraintKey
        let conKey = _ConstraintKey(attribute: attribute, toItemHashValue: toItem.hashValue, toAttribute: toAttribute, relation: relation, multiply: 1)
        
        // 4. retrive an constraint from cache, if any
        let con: NSLayoutConstraint
        if let c = self._item._constraintsWapper.deactiveConstraints.removeValue(forKey: conKey.hashValue) {
            // 4.1 have cached
            con = c
            con.constant = constant
            con.priority = priority
        } else {
            // 4.2 not cache
            con = NSLayoutConstraint(item: self._item, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: toAttribute, multiplier: 1, constant: constant)
            con.priority = priority
        }
        
        // 5. install constraint
        con.isActive = true
        self._item._constraintsWapper.activeConstraints[attribute] = con
        
        // 6. return self
        return self
    }
    
    /// make constraint Size
    private func _makeSize(for attribute: _Attribute, constant: CGFloat, by relation: Relation, to attributeSize: AttributeSize?, multiply: CGFloat, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to size
        switch attribute {
        case .width, .height: break
        default: fatalError("Driftwood ConstraintMaker Error: attribute \(attribute) is not belong to size!")
        }
        
        // 1. check if there was an constraint already installed by driftwood
        guard nil == self._item._constraintsWapper.activeConstraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._item.description) already have \(attribute) constraint!")
        }
        
        // 2. retrieve (toItem & toAttribute) from AttributeSize
        var toAttribute: _Attribute?
        var toItem: DriftwoodItem?
        if let attrSize = attributeSize {
            switch attrSize {
            case .width(let item):
                toAttribute = .width
                toItem = item
                
            case .height(let item):
                toAttribute = .height
                toItem = item
            }
        }
        
        // 3. generate a _ConstraintKey
        let conKey = _ConstraintKey(attribute: attribute, toItemHashValue: toItem?.hashValue, toAttribute: toAttribute ?? .notAnAttribute, relation: relation, multiply: multiply)
        
        // 4. retrive an constraint from cache, if any
        let con: NSLayoutConstraint
        if let c = self._item._constraintsWapper.deactiveConstraints.removeValue(forKey: conKey.hashValue) {
            // 4.1 have cached
            con = c
            con.constant = constant
            con.priority = priority
        } else {
            // 4.2 not cache
            con = NSLayoutConstraint(item: self._item, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: toAttribute ?? .notAnAttribute, multiplier: multiply, constant: constant)
            con.priority = priority
        }
        
        // 5. install constraint
        con.isActive = true
        self._item._constraintsWapper.activeConstraints[attribute] = con
        
        // 6. return self
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
    /// _item
    private let _item: DriftwoodItem
    
    /// init
    fileprivate init(item: DriftwoodItem) {
        self._item = item
    }
    
    /// update constraint
    private func _update(for attribute: _Attribute, constant: CGFloat?, priority: Priority?) -> ConstraintUpdater {
        guard let con = self._item._constraintsWapper.activeConstraints[attribute] else {
            fatalError("Driftwood ConstraintUpdater Error: \(self._item.description) have no \(attribute) constraint!")
        }
        
        if let constant = constant { con.constant = constant }
        if let priority = priority { con.priority = priority }
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
    /// _item
    private let _item: DriftwoodItem
    
    /// init
    fileprivate init(item: DriftwoodItem) {
        self._item = item
    }
    
    /// remove constraint
    private func _remove(for attribute: _Attribute) -> ConstraintRemover {
        // 0. remove an constraint installed by driftwood, if any
        guard let con = self._item._constraintsWapper.activeConstraints.removeValue(forKey: attribute) else {
            fatalError("Driftwood ConstraintRemover Error: \(self._item.description) have no \(attribute) constraint!")
        }
        con.isActive = false
        
        // 1. generate a _ConstraintKey
        let conKey = _ConstraintKey(attribute: con.firstAttribute, toItemHashValue: con.secondItem?.hashValue, toAttribute: con.secondAttribute, relation: con.relation, multiply: con.multiplier)
        
        // 2. cache constraint
        self._item._constraintsWapper.deactiveConstraints[conKey.hashValue] = con
        
        // 3. return self
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
        return ConstraintMaker(item: _item)
    }
    
    /// update
    public var update: ConstraintUpdater {
        return ConstraintUpdater(item: _item)
    }
    
    /// remove
    public var remove: ConstraintRemover {
        return ConstraintRemover(item: _item)
    }
    
    /// remake
    public var remake: ConstraintMaker {
        // 0. remove all constraints installed by driftwood
        for con in self._item._constraintsWapper.activeConstraints.values {
            con.isActive = false
            let conKey = _ConstraintKey(attribute: con.firstAttribute, toItemHashValue: con.secondItem?.hashValue, toAttribute: con.secondAttribute, relation: con.relation, multiply: con.multiplier)
            self._item._constraintsWapper.deactiveConstraints[conKey.hashValue] = con
        }
        self._item._constraintsWapper.activeConstraints = [:]
        
        return ConstraintMaker(item: self._item)
    }
    
    //===========================================
    // AttributeX
    //===========================================
    //
    /// left
    public var left: AttributeX { return .left(_item) }
    
    /// right
    public var right: AttributeX { return .right(_item) }
    
    /// leading
    public var leading: AttributeX { return .leading(_item) }
    
    /// trailing
    public var trailing: AttributeX { return .trailing(_item) }
    
    /// centerX
    public var centerX: AttributeX { return .centerX(_item) }
    
    /// leftMargin
    @available(iOS 8.0, *)
    public var leftMargin: AttributeX { return .leftMargin(_item) }
    
    /// rightMargin
    @available(iOS 8.0, *)
    public var rightMargin: AttributeX { return .rightMargin(_item) }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    public var leadingMargin: AttributeX { return .leadingMargin(_item) }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    public var trailingMargin: AttributeX { return .trailingMargin(_item) }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    public var centerXWithinMargins: AttributeX { return .centerXWithinMargins(_item) }
    
    //===========================================
    // AttributeY
    //===========================================
    //
    /// top
    public var top: AttributeY { return .top(_item) }
    
    /// bottom
    public var bottom: AttributeY { return .bottom(_item) }
    
    /// centerY
    public var centerY: AttributeY { return .centerY(_item) }
    
    /// lastBaseline
    public var lastBaseline: AttributeY { return .lastBaseline(_item) }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    public var firstBaseline: AttributeY { return .firstBaseline(_item) }
    
    /// topMargin
    @available(iOS 8.0, *)
    public var topMargin: AttributeY { return .topMargin(_item) }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    public var bottomMargin: AttributeY { return .bottomMargin(_item) }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    public var centerYWithinMargins: AttributeY { return .centerYWithinMargins(_item) }
    
    //===========================================
    // AttributeSize
    //===========================================
    //
    /// width
    public var width: AttributeSize { return .width(_item) }
    
    /// height
    public var height: AttributeSize { return .height(_item) }
    
    //===========================================
    // Private
    //===========================================
    //
    /// init
    fileprivate init(_ item: DriftwoodItem) { _item = item }
    
    /// _item
    fileprivate let _item: DriftwoodItem
}


/// UIView+Driftwood
extension UIView {
    
    /// driftwood
    public var dw: Driftwood { return Driftwood(self) }
}


/// UILayoutGuide+Driftwood
@available(iOS 9.0, *)
extension UILayoutGuide {
    
    /// driftwood
    public var dw: Driftwood { return Driftwood(self) }
}


//===========================================
// Private
//===========================================
//
/// _Attribute
fileprivate typealias _Attribute = NSLayoutConstraint.Attribute


/// _ConstraintKey
fileprivate struct _ConstraintKey: Hashable {   // Automatic Synthesis Hashable is available in Swift 4.1
    let attribute: _Attribute
    let toItemHashValue: Int?
    let toAttribute: _Attribute
    let relation: Relation
    let multiply: CGFloat
}


/// _ConstraintsWrapper
fileprivate class _ConstraintsWrapper {
    
    /// active constraints
    var activeConstraints: [_Attribute: NSLayoutConstraint] = [:]
    
    /// deactive constraints
    var deactiveConstraints: [Int: NSLayoutConstraint] = [:]
}


/// DriftwoodItem+_ConstraintsWrapper
extension DriftwoodItem {
    
    /// constraints wrapper
    fileprivate var _constraintsWapper: _ConstraintsWrapper {
        if let cw = objc_getAssociatedObject(self, &_constraintsWapperKey) as? _ConstraintsWrapper {
            return cw
        } else {
            let cw = _ConstraintsWrapper()
            objc_setAssociatedObject(self, &_constraintsWapperKey, cw, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return cw
        }
    }
}


/// _constraintsWapper Key
fileprivate var _constraintsWapperKey: Void?
