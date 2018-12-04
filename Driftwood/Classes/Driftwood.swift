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


/// Item
public protocol Item: class {
    
    /// dw_superview
    var dw_superview: Item? { get }
    
    /// dw_description
    var dw_description: String { get }
    
    /// dw_hashValue
    var dw_hashValue: Int { get }
}


/// Relation
public typealias Relation = NSLayoutConstraint.Relation


/// Priority
public typealias Priority = UILayoutPriority


/// Horizontal attribute
public enum AttributeX {
    
    case superview
    
    case left(Item)
    
    case right(Item)
    
    case leading(Item)
    
    case trailing(Item)
    
    case centerX(Item)
    
    @available(iOS 8.0, *)
    case leftMargin(Item)
    
    @available(iOS 8.0, *)
    case rightMargin(Item)
    
    @available(iOS 8.0, *)
    case leadingMargin(Item)
    
    @available(iOS 8.0, *)
    case trailingMargin(Item)
    
    @available(iOS 8.0, *)
    case centerXWithinMargins(Item)
}


/// Vertical attribute
public enum AttributeY {
    
    case superview
    
    case top(Item)
    
    case bottom(Item)
    
    case centerY(Item)
    
    case lastBaseline(Item)
    
    @available(iOS 8.0, *)
    case firstBaseline(Item)
    
    @available(iOS 8.0, *)
    case topMargin(Item)
    
    @available(iOS 8.0, *)
    case bottomMargin(Item)
    
    @available(iOS 8.0, *)
    case centerYWithinMargins(Item)
}


/// Size attribute
public enum AttributeSize {
    
    case width(Item)
    
    case height(Item)
}


/// Constraint Maker
public struct ConstraintMaker {
    
    //===========================================
    // Make AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .left, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .right, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .leading, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .trailing, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .centerX, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .leftMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .rightMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .leadingMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> ConstraintMaker {
        return self._makeX(for: .trailingMargin, constant: constant, by: relation, to: attribute, priority: priority)
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
    /// top
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .top, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .bottom, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .centerY, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .lastBaseline, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .firstBaseline, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .topMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> ConstraintMaker {
        return self._makeY(for: .bottomMargin, constant: constant, by: relation, to: attribute, priority: priority)
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
    /// make X-axis's constraint
    @discardableResult
    private func _makeX(for attribute: _Attribute, constant: CGFloat, by relation: Relation, to attributeX: AttributeX, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to X-axis. (execute only in debug mode)
        assert({
            switch attribute {
            case .left, .right, .leading, .trailing, .centerX, .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins:
                return true
            default:
                return false
            }
        }(), "Driftwood [dw.make] error: attribute '\(_type(of: attribute))' is not belong to X-axis.")
        
        // 1. check if there was a constraint already installed by driftwood
        guard self._item._storage.hasActiveConstraint(for: attribute) == false else {
            _debugPrint("Driftwood [dw.make] error: \(self._item.dw_description) already have '\(_type(of: attribute))' constraint.")
            return self
        }
        
        // 2. retrieve (toItem & toAttribute) from AttributeX
        let toAttribute: _Attribute
        let toItem: Item
        switch attributeX {
        case .superview:
            // check if there is an superview
            guard let superview = self._item.dw_superview else {
                _debugPrint("Driftwood [dw.make] error: \(self._item.dw_description) have no superview.")
                return self
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
        
        // 3. dequeue cached constraint
        let con = self._item._storage.deququeConstraintFor(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute, multiply: 1, constant: constant, priority: priority)
        
        // 4. activate cached constraint
        self._item._storage.activate(con, for: attribute)
        
        // 5. return self
        return self
    }
    
    /// make Y-axis's constraint
    @discardableResult
    private func _makeY(for attribute: _Attribute, constant: CGFloat, by relation: Relation, to attributeY: AttributeY, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to Y-axis. (execute only in debug mode)
        assert({
            switch attribute {
            case .top, .bottom, .centerY, .lastBaseline, .firstBaseline, .topMargin, .bottomMargin, .centerYWithinMargins:
                return true
            default:
                return false
            }
        }(), "Driftwood [dw.make] error: attribute '\(_type(of: attribute))' is not belong to Y-axis.")
        
        // 1. check if there was a constraint already installed by driftwood
        guard self._item._storage.hasActiveConstraint(for: attribute) == false else {
            _debugPrint("Driftwood [dw.make] error: \(self._item.dw_description) already have '\(_type(of: attribute))' constraint.")
            return self
        }
        
        // 2. retrieve (toItem & toAttribute) from AttributeY
        let toAttribute: _Attribute
        let toItem: Item
        switch attributeY {
        case .superview:
            // check if there is an superview
            guard let superview = self._item.dw_superview else {
                _debugPrint("Driftwood [dw.make] error: \(self._item.dw_description) have no superview.")
                return self
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
        
        // 3. dequeue cached constraint
        let con = self._item._storage.deququeConstraintFor(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute, multiply: 1, constant: constant, priority: priority)
        
        // 4. activate cached constraint
        self._item._storage.activate(con, for: attribute)
        
        // 5. return self
        return self
    }
    
    /// make Size's constraint
    @discardableResult
    private func _makeSize(for attribute: _Attribute, constant: CGFloat, by relation: Relation, to attributeSize: AttributeSize?, multiply: CGFloat, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to size. (execute only in debug mode)
        assert({
            switch attribute {
            case .width, .height:
                return true
            default:
                return false
            }
        }(), "Driftwood [dw.make] error: attribute '\(_type(of: attribute))' is not belong to size.")
        
        // 1. check if there was a constraint already installed by driftwood
        guard self._item._storage.hasActiveConstraint(for: attribute) == false else {
            _debugPrint("Driftwood [dw.make] error: \(self._item.dw_description) already have '\(_type(of: attribute))' constraint.")
            return self
        }
        
        // 2. retrieve (toItem & toAttribute) from AttributeSize
        var toAttribute: _Attribute?
        var toItem: Item?
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
        
        // 3. dequeue cached constraint
        let con = self._item._storage.deququeConstraintFor(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute ?? .notAnAttribute, multiply: multiply, constant: constant, priority: priority)
        
        // 4. activate cached constraint
        self._item._storage.activate(con, for: attribute)
        
        // 5. return self
        return self
    }
    
    /// _item
    private let _item: Item
    
    /// init
    fileprivate init(_ item: Item) { _item = item }
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
    /// update constraint
    @discardableResult
    private func _update(for attribute: _Attribute, constant: CGFloat?, priority: Priority?) -> ConstraintUpdater {
        // 0. check if there was a constraint already installed by driftwood
        guard self._item._storage.hasActiveConstraint(for: attribute) == true else {
            _debugPrint("Driftwood [dw.update] error: \(self._item.dw_description) have no '\(_type(of: attribute))' constraint.")
            return self
        }
        
        // 1. deactivate a constraint already installed by driftwood
        let con = self._item._storage.deactivate(for: attribute)!
        
        // 2. update this constraint
        if let constant = constant { con.constant = constant }
        if let priority = priority { con.priority = priority }
        
        // 3. activate this constraint
        self._item._storage.activate(con, for: attribute)
        
        // 4. return self
        return self
    }
    
    /// _item
    private let _item: Item
    
    /// init
    fileprivate init(_ item: Item) { _item = item }
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
    /// remove constraint
    @discardableResult
    private func _remove(for attribute: _Attribute) -> ConstraintRemover {
        // 0. deactivate a constraint installed by driftwood if any
        guard let _ = self._item._storage.deactivate(for: attribute) else {
            _debugPrint("Driftwood [dw.remove] error: \(self._item.dw_description) have no '\(_type(of: attribute))' constraint.")
            return self
        }
        
        // 1. return self
        return self
    }
    
    /// _item
    private let _item: Item
    
    /// init
    fileprivate init(_ item: Item) { _item = item }
}


/// Driftwood
public struct Driftwood {
    
    //===========================================
    // Make, Update, Remove, Remake Constraint
    //===========================================
    //
    /// make
    public var make: ConstraintMaker {
        return ConstraintMaker(_item)
    }
    
    /// update
    public var update: ConstraintUpdater {
        return ConstraintUpdater(_item)
    }
    
    /// remove
    public var remove: ConstraintRemover {
        return ConstraintRemover(_item)
    }
    
    /// remake
    public var remake: ConstraintMaker {
        self._item._storage.deactivateAll()
        return ConstraintMaker(_item)
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
    // Debug
    //===========================================
    //
    /// attaching a debug-label for current View/LayoutGuide
    public func labeled(_ lb: String) -> Driftwood {
        self._item._storage.labeled = lb
        return self
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// _item
    private let _item: Item
    
    /// init
    fileprivate init(_ item: Item) { _item = item }
}


/// UIView+Item
extension UIView: Item {
    
    public var dw_superview: Item? {
        return self.superview
    }

    public var dw_description: String {
        var desc = "<\(_type(of: self)): \(_pointer(of: self))"
        if let label = self._storage.labeled {
            desc += "; Labeled: '\(label)'>"
        } else {
            desc += ">"
        }
        return desc
    }

    public var dw_hashValue: Int {
        return self.hashValue
    }
}


/// UILayoutGuide+Item
@available(iOS 9.0, *)
extension UILayoutGuide: Item {
    
    public var dw_superview: Item? {
        return self.owningView
    }
    
    public var dw_description: String {
        var desc = "<\(_type(of: self)): \(_pointer(of: self))"
        if let label = self._storage.labeled {
            desc += "; Labeled: '\(label)'>"
        } else {
            desc += ">"
        }
        return desc
    }
    
    public var dw_hashValue: Int {
        return self.hashValue
    }
}


/// UIView+Driftwood
extension UIView {
    
    /// driftwood
    public var dw: Driftwood {
        return Driftwood(self)
    }
}


/// UILayoutGuide+Driftwood
@available(iOS 9.0, *)
extension UILayoutGuide {

    /// driftwood
    public var dw: Driftwood {
        return Driftwood(self)
    }
}


//===========================================
// Private
//===========================================
//
/// _Attribute
fileprivate typealias _Attribute = NSLayoutConstraint.Attribute


/// _Storage
fileprivate class _Storage {
    
    //===========================================
    // Fileprivate
    //===========================================
    //
    /// labeled name for current item
    var labeled: String?
    
    /// has an active constraint installed by driftwood
    func hasActiveConstraint(for key: _Attribute) -> Bool {
        return self._activeConstraints.keys.contains(key)
    }
    
    /// activate a constraint
    func activate(_ con: NSLayoutConstraint, for key: _Attribute) {
        con.isActive = true
        self._activeConstraints[key] = con
    }
    
    /// deactivate a constraint installed by driftwood
    @discardableResult
    func deactivate(for key: _Attribute) -> NSLayoutConstraint? {
        let con = self._activeConstraints.removeValue(forKey: key)
        con?.isActive = false
        return con
    }
    
    /// deactivate all constraints installed by driftwood
    func deactivateAll() {
        self._activeConstraints.forEach({ $1.isActive = false })
        self._activeConstraints = [:]
    }
    
    /// dequeue a constraint cached by driftwood
    func deququeConstraintFor(item: Item, attribute: _Attribute, relation: Relation, toItem: Item?, toAttribute: _Attribute, multiply: CGFloat, constant: CGFloat, priority: Priority) -> NSLayoutConstraint {
        // 0. generate a constraint hash value (hash calculation not include item/constant/priority)
        var hasher = Hasher()
        hasher.combine(attribute)
        hasher.combine(toItem?.dw_hashValue)
        hasher.combine(toAttribute)
        hasher.combine(relation)
        hasher.combine(multiply)
        let conKey = hasher.finalize()
        
        // 1. retrive a constraint from cache, if any
        let con: NSLayoutConstraint
        if let c = self._cachedConstraints[conKey] {
            // 1.1 cached
            con = c
            con.constant = constant
            con.priority = priority
        } else {
            // 1.2 no cache
            con = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: toAttribute, multiplier: multiply, constant: constant)
            con.priority = priority
            self._cachedConstraints[conKey] = con
        }
        
        // 2. return constraint
        return con
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// active constraints
    private var _activeConstraints: [_Attribute: NSLayoutConstraint] = [:]
    
    /// cached constraints (include active/deactive constraints)
    private var _cachedConstraints: [Int: NSLayoutConstraint] = [:]
}


/// Item+_Storage
extension Item {
    
    /// _storage
    fileprivate var _storage: _Storage {
        if let s = objc_getAssociatedObject(self, &_storageKey) as? _Storage {
            return s
        } else {
            let s = _Storage()
            objc_setAssociatedObject(self, &_storageKey, s, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return s
        }
    }
}


/// _storage Key
fileprivate var _storageKey: Void?


//===========================================
// Debug tool
//===========================================
//
/// return a type name of an object
fileprivate func _type(of anyObject: AnyObject) -> String {
    return String(describing: type(of: anyObject))
}


/// return an address of an object
fileprivate func _pointer(of anyObject: AnyObject) -> String {
    let opaque: UnsafeMutableRawPointer = Unmanaged.passUnretained(anyObject).toOpaque()
    return String(describing: opaque)
}


/// return a case name of an _Attribute
fileprivate func _type(of attribute: _Attribute) -> String {
    switch attribute {
    case .left:
        return "left"
    case .right:
        return "right"
    case .top:
        return "top"
    case .bottom:
        return "bottom"
    case .leading:
        return "leading"
    case .trailing:
        return "trailing"
    case .width:
        return "width"
    case .height:
        return "height"
    case .centerX:
        return "centerX"
    case .centerY:
        return "centerY"
    case .lastBaseline:
        return "lastBaseline"
    case .firstBaseline:
        return "firstBaseline"
    case .leftMargin:
        return "leftMargin"
    case .rightMargin:
        return "rightMargin"
    case .topMargin:
        return "topMargin"
    case .bottomMargin:
        return "bottomMargin"
    case .leadingMargin:
        return "leadingMargin"
    case .trailingMargin:
        return "trailingMargin"
    case .centerXWithinMargins:
        return "centerXWithinMargins"
    case .centerYWithinMargins:
        return "centerYWithinMargins"
    case .notAnAttribute:
        return "notAnAttribute"
    }
}


/// print only in debug mode (execute only in debug mode)
fileprivate func _debugPrint(_ item: @autoclosure () -> Any) {
    assert({ print(item()); return true }())
}
