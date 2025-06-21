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


import ObjectiveC.runtime
import Foundation


/// Storage
final class Storage {
    
    // MARK: Instantiation for item
    /// Associated storage for item if any
    static func anyStorage(for item: Item) -> Storage? {
        objc_getAssociatedObject(item, &Self._associatedKey) as? Storage
    }
    
    /// Associated storage for item
    static func storage(for item: Item) -> Storage {
        if let s = Self.anyStorage(for: item) {
            return s
        } else {
            let s = Storage()
            objc_setAssociatedObject(item, &Self._associatedKey, s, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return s
        }
    }
    
    // MARK: Debug
    /// labeled name for current Item
    var labeledName: String?
    
    // MARK: Constraint activate & update & deactivate
    /// active constraints count
    var activeConstraintsCount: Int {
        self._activeConstraints.count
    }
    
    /// cached constraints count
    var cachedConstraints: Int {
        self._cachedConstraints.count
    }
    
    /// active constraint installed by driftwood
    func activeConstraint(for key: Attribute) -> Constraint? {
        self._activeConstraints[key]
    }
    
    /// activate a constraint
    func activate(_ con: Constraint, for key: Attribute, location: Debug.Location, operation: Debug.Operation) {
        // set debug info
        con.location = location
        con.operation = operation
        
        // activate constraint
        con.isActive = true
        
        // save constraint
        self._activeConstraints[key] = con
    }
    
    /// update an active constraint installed by driftwood
    func update(_ con: Constraint, constant: CGFloat?, priority: Priority?, location: Debug.Location, operation: Debug.Operation) {
        // set debug info
        con.location = location
        con.operation = operation
        
        // update constraint.constant
        if let constant = constant {
            con.constant = constant
        }
        
        // update constraint.priority
        if let priority = priority {
            con.priority = priority
        }
    }
    
    /// deactivate a constraint installed by driftwood
    @discardableResult
    func deactivate(for key: Attribute) -> Constraint? {
        // remove constraint
        let con = self._activeConstraints.removeValue(forKey: key)
        
        // deactivate constraint
        con?.isActive = false
        
        return con
    }
    
    /// deactivate all constraints installed by driftwood
    func deactivateAll() {
        // for each constraint
        self._activeConstraints.forEach {
            
            // deactivate constraint
            $1.isActive = false
        }
        
        // remove all constraint
        self._activeConstraints.removeAll()
    }
    
    /// get a constraint cached by driftwood
    func constraint(item: Item, attribute: Attribute, relation: Relation, toItem: Item?, toAttribute: Attribute, multiply: CGFloat, constant: CGFloat, priority: Priority) -> Constraint {
        // 0. generate a constraint key (key calculation not include item/constant/priority)
        let conKey = ConstraintKey(attribute: attribute, toItem: toItem, toAttribute: toAttribute, relation: relation, multiply: multiply)
        
        // 1. retrive a constraint from cache, and check is safe to change constraint's priority
        let con: Constraint
        if let c = self._cachedConstraints[conKey], Priority.isSafeToChangePriority(from: c.priority, to: priority) {
            // 1.1 cached and is safe to change constraint's priority
            con = c
            con.constant = constant
            con.priority = priority
        } else {
            // 1.2 no cache or is not safe to change constraint's priority, may replace cached constraint
            con = Constraint(item: item, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: toAttribute, multiplier: multiply, constant: constant)
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
    ///
    /// In most case, there will be 4 active constraints on current Item
    private var _activeConstraints = [Attribute: Constraint](minimumCapacity: 4)
    
    /// cached constraints (include active/deactive constraints)
    private var _cachedConstraints = [ConstraintKey: Constraint](minimumCapacity: 4)
    
    /// associated key
    private static var _associatedKey: Void?
    
    /// init
    private init() {}
}
