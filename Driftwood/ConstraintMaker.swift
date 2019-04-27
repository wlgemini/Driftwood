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


#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


/// Constraint Maker
public struct ConstraintMaker {
    
    //===========================================
    // Make ConstraintAttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .left, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .right, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .leading, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .trailing, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .centerX, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .leftMargin, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// rightMargin
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .rightMargin, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// leadingMargin
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .leadingMargin, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// trailingMargin
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .trailingMargin, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    
    /// centerXWithinMargins
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeX: ConstraintAttributeX, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeX(for: .centerXWithinMargins, constant: constant, by: relation, to: attributeX, priority: priority)
    }
    #endif
    
    //===========================================
    // Make ConstraintAttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .top, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .bottom, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .centerY, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .lastBaseline, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    /// firstBaseline
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .firstBaseline, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .topMargin, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    /// bottomMargin
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .bottomMargin, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    
    /// centerYWithinMargins
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeY: ConstraintAttributeY, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeY(for: .centerYWithinMargins, constant: constant, by: relation, to: attributeY, priority: priority)
    }
    #endif
    
    //===========================================
    // Make ConstraintAttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeSize: ConstraintAttributeSize? = nil, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeSize(for: .width, constant: constant, by: relation, to: attributeSize, multiply: multiply, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat, by relation: Relation = Preferences.relation, to attributeSize: ConstraintAttributeSize? = nil, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self._makeSize(for: .height, constant: constant, by: relation, to: attributeSize, multiply: multiply, priority: priority)
    }
    
    //===========================================
    // Internal
    //===========================================
    //
    /// init
    init(item: ConstraintItem, location: Debug.Location) {
        self._item = item
        self._location = location
        
        // set translatesAutoresizingMaskIntoConstraints on View.
        if let view = self._item as? View {
            view.translatesAutoresizingMaskIntoConstraints = Preferences.translatesAutoresizingMaskIntoConstraints
        }
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// make X-axis's constraint
    @discardableResult
    private func _makeX(for attribute: Attribute, constant: CGFloat, by relation: Relation, to attributeX: ConstraintAttributeX, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to X-axis. (execute only in debug mode)
        Debug.assert(self._location, .make(attribute), condition: {
            switch attribute {
            case .left, .right, .leading, .trailing, .centerX: return true
                #if os(iOS) || os(tvOS)
            case .leftMargin, .rightMargin, .leadingMargin, .trailingMargin, .centerXWithinMargins: return true
                #endif
            default: return false
            }
        }, message: "Attribute is not belong to 'X-axis'.")
        
        // 1. check if there was a constraint already installed by driftwood
        guard self._item.storage.activeConstraint(for: attribute) == nil else {
            Debug.log(self._location, .make(attribute), self._item, message: "Duplicated constraint.")
            return self
        }
        
        // 2. retrieve (toItem & toAttribute) from attributeX
        let toAttribute: Attribute
        let toItem: ConstraintItem
        switch attributeX {
        case .superview:
            // check if there is an superview
            guard let superview = self._item.dw_superview else {
                Debug.log(self._location, .make(attribute), self._item, message: "No superview.")
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
            
            #if os(iOS) || os(tvOS)
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
            #endif
        }
        
        // 3. dequeue cached constraint
        let con = self._item.storage.dequeueConstraintFor(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute, multiply: 1.0, constant: constant, priority: priority)
        
        // 4. activate cached constraint
        self._item.storage.activate(con, for: attribute, location: self._location, operation: .make(attribute))
        
        // 5. return self
        return self
    }
    
    /// make Y-axis's constraint
    @discardableResult
    private func _makeY(for attribute: Attribute, constant: CGFloat, by relation: Relation, to attributeY: ConstraintAttributeY, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to Y-axis. (execute only in debug mode)
        Debug.assert(self._location, .make(attribute), condition: {
            switch attribute {
            case .top, .bottom, .centerY, .lastBaseline, .firstBaseline: return true
                #if os(iOS) || os(tvOS)
            case .topMargin, .bottomMargin, .centerYWithinMargins: return true
                #endif
            default: return false
            }
        }, message: "Attribute is not belong to 'Y-axis'.")
        
        // 1. check if there was a constraint already installed by driftwood
        guard self._item.storage.activeConstraint(for: attribute) == nil else {
            Debug.log(self._location, .make(attribute), self._item, message: "Duplicated constraint.")
            return self
        }
        
        // 2. retrieve (toItem & toAttribute) from attributeY
        let toAttribute: Attribute
        let toItem: ConstraintItem
        switch attributeY {
        case .superview:
            // check if there is an superview
            guard let superview = self._item.dw_superview else {
                Debug.log(self._location, .make(attribute), self._item, message: "No superview.")
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
            
            #if os(iOS) || os(tvOS)
        case .topMargin(let item):
            toAttribute = .topMargin
            toItem = item
            
        case .bottomMargin(let item):
            toAttribute = .bottomMargin
            toItem = item
            
        case .centerYWithinMargins(let item):
            toAttribute = .centerYWithinMargins
            toItem = item
            #endif
        }
        
        // 3. dequeue cached constraint
        let con = self._item.storage.dequeueConstraintFor(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute, multiply: 1.0, constant: constant, priority: priority)
        
        // 4. activate cached constraint
        self._item.storage.activate(con, for: attribute, location: self._location, operation: .make(attribute))
        
        // 5. return self
        return self
    }
    
    /// make Size's constraint
    @discardableResult
    private func _makeSize(for attribute: Attribute, constant: CGFloat, by relation: Relation, to attributeSize: ConstraintAttributeSize?, multiply: CGFloat, priority: Priority) -> ConstraintMaker {
        // 0. check if attribute belong to size. (execute only in debug mode)
        Debug.assert(self._location, .make(attribute), condition: {
            switch attribute {
            case .width, .height: return true
            default: return false
            }
        }, message: "Attribute is not belong to 'Size'.")
        
        // 1. check if there was a constraint already installed by driftwood
        guard self._item.storage.activeConstraint(for: attribute) == nil else {
            Debug.log(self._location, .make(attribute), self._item, message: "Duplicated constraint.")
            return self
        }
        
        // 2. retrieve (toItem & toAttribute) from attributeSize
        var toAttribute: Attribute?
        var toItem: ConstraintItem?
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
        let con = self._item.storage.dequeueConstraintFor(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute ?? .notAnAttribute, multiply: multiply, constant: constant, priority: priority)
        
        // 4. activate cached constraint
        self._item.storage.activate(con, for: attribute, location: self._location, operation: .make(attribute))
        
        // 5. return self
        return self
    }
    
    /// item
    private let _item: ConstraintItem
    
    /// location
    private let _location: Debug.Location
}
