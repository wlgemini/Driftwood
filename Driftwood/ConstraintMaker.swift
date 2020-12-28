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


/// ConstraintMaker
public struct ConstraintMaker {
    
    // MARK: -
    // MARK: Make horizontal constraint
    /// left
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .left, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .right, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .leading, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .trailing, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .centerX, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .leftMargin, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// rightMargin
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .rightMargin, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// leadingMargin
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .leadingMargin, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// trailingMargin
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .trailingMargin, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    
    /// centerXWithinMargins
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, to hAttribute: HAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .centerXWithinMargins, constant: constant, relation: relation, hAttribute: hAttribute, multiply: multiply, priority: priority)
    }
    #endif
    
    // MARK: -
    // MARK: Make vertical constraint
    /// top
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .top, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .bottom, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .centerY, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .lastBaseline, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    /// firstBaseline
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .firstBaseline, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .topMargin, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    /// bottomMargin
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .bottomMargin, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    
    /// centerYWithinMargins
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, to vAttribute: VAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .centerYWithinMargins, constant: constant, relation: relation, vAttribute: vAttribute, multiply: multiply, priority: priority)
    }
    #endif
    
    // MARK: -
    // MARK: Make size constraint
    /// width
    @discardableResult
    public func width(_ constant: CGFloat, by relation: Relation = Preferences.relation, to sAttribute: SAttribute? = nil, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .width, constant: constant, relation: relation, sAttribute: sAttribute, multiply: multiply, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat, by relation: Relation = Preferences.relation, to sAttribute: SAttribute? = nil, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self._make(attribute: .height, constant: constant, relation: relation, sAttribute: sAttribute, multiply: multiply, priority: priority)
    }
    
    // MARK: - Internal
    /// init
    init(item: Item, superview: View?, location: Debug.Location, labeled name: String?) {
        self._item = item
        self._superview = superview
        self._storage = Storage.storage(for: item)
        self._location = location
        
        // set label
        if let nm = name {
            self._storage.labeledName = nm
        }
        
        // set translatesAutoresizingMaskIntoConstraints on View.
        if let view = self._item as? View {
            view.translatesAutoresizingMaskIntoConstraints = Preferences.translatesAutoresizingMaskIntoConstraints
        }
    }
    
    // MARK: - Private
    /// Make horizontal constraint
    private func _make(attribute: Attribute, constant: CGFloat, relation: Relation, hAttribute: HAttribute, multiply: CGFloat, priority: Priority) -> Self {
        // 0.0 check is valid multiplier (multiplier can't be 0 for HAttribute/VAttribute)
        guard multiply != 0 else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Multiplier can't be 0 for HAttribute/VAttribute.")
            return self
        }
        
        // 0.1 check is valid priority
        guard Priority.isValidPriority(priority) else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Invalid priority with value (\(priority.rawValue)).")
            return self
        }
        
        // 0.2 check if there was a constraint already installed by driftwood
        guard self._storage.activeConstraint(for: attribute) == nil else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Duplicated constraint.")
            return self
        }
        
        // 1. retrieve (toItem & toAttribute) from hAttribute
        let toAttribute: Attribute
        let toItem: Item
        switch hAttribute {
        case .superview:
            // check if there is an superview
            guard let superview = self._superview else {
                Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "No superview/owningView.")
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
        
        // 2. get cached constraint
        let con = self._storage.constraint(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute, multiply: multiply, constant: constant, priority: priority)
        
        // 3. activate cached constraint
        self._storage.activate(con, for: attribute, location: self._location, operation: .make(attribute))
        
        // 4. return self
        return self
    }
    
    /// Make vertical constraint
    private func _make(attribute: Attribute, constant: CGFloat, relation: Relation, vAttribute: VAttribute, multiply: CGFloat, priority: Priority) -> Self {
        // 0.0 check is valid multiplier (multiplier can't be 0 for HAttribute/VAttribute)
        guard multiply != 0 else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Multiplier can't be 0 for HAttribute/VAttribute.")
            return self
        }
        
        // 0.1 check is valid priority
        guard Priority.isValidPriority(priority) else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Invalid priority with value (\(priority.rawValue)).")
            return self
        }
        
        // 0.2 check if there was a constraint already installed by driftwood
        guard self._storage.activeConstraint(for: attribute) == nil else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Duplicated constraint.")
            return self
        }
        
        // 1. retrieve (toItem & toAttribute) from vAttribute
        let toAttribute: Attribute
        let toItem: Item
        switch vAttribute {
        case .superview:
            // check if there is an superview
            guard let superview = self._superview else {
                Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "No superview/owningView.")
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
        
        // 2. get cached constraint
        let con = self._storage.constraint(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute, multiply: multiply, constant: constant, priority: priority)
        
        // 3. activate cached constraint
        self._storage.activate(con, for: attribute, location: self._location, operation: .make(attribute))
        
        // 4. return self
        return self
    }
    
    /// Make size constraint
    private func _make(attribute: Attribute, constant: CGFloat, relation: Relation, sAttribute: SAttribute?, multiply: CGFloat, priority: Priority) -> Self {
        // 0.0 check is valid priority
        guard Priority.isValidPriority(priority) else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Invalid priority with value (\(priority.rawValue)).")
            return self
        }
        
        // 0.1 check if there was a constraint already installed by driftwood
        guard self._storage.activeConstraint(for: attribute) == nil else {
            Debug.log(location: self._location, operation: .make(attribute), item: self._item, message: "Duplicated constraint.")
            return self
        }
        
        // 1. retrieve (toItem & toAttribute) from sAttribute
        var toAttribute: Attribute?
        var toItem: Item?
        if let sAttr = sAttribute {
            switch sAttr {
            case .width(let item):
                toAttribute = .width
                toItem = item
                
            case .height(let item):
                toAttribute = .height
                toItem = item
            }
        }
        
        // 2. get cached constraint
        let con = self._storage.constraint(item: self._item, attribute: attribute, relation: relation, toItem: toItem, toAttribute: toAttribute ?? .notAnAttribute, multiply: multiply, constant: constant, priority: priority)
        
        // 3. activate cached constraint
        self._storage.activate(con, for: attribute, location: self._location, operation: .make(attribute))
        
        // 4. return self
        return self
    }
    
    /// a `View/LayoutGuide`
    private unowned(unsafe) let _item: Item
    
    /// a `View`
    private unowned(unsafe) let _superview: View?
    
    /// a `Storage`
    private unowned(unsafe) let _storage: Storage
    
    /// a `Location`
    private let _location: Debug.Location
}
