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


/// ConstraintsStorage
class ConstraintsStorage {
    
    // MARK: Debug
    /// labeled name for current constraint item
    var labeled: String?
    
    // MARK: Constraint add & remove
    /// has an active constraint installed by driftwood
    func hasActiveConstraint(for key: Attribute) -> Bool {
        return self._activeConstraints.keys.contains(key)
    }
    
    /// activate a constraint
    func activate(_ con: LayoutConstraint, for key: Attribute) {
        // check if constraint is 'active'
        assert(con.isActive == false, "Driftwood internal error: found 'active' while activate constraint '\(_type(of:key))'.")
        
        con.isActive = true
        self._activeConstraints[key] = con
    }
    
    /// update an active constraint installed by driftwood
    func update(constant: CGFloat?, priority: Priority?, for key: Attribute) {
        // check if there was an constraint
        guard let con = self._activeConstraints[key] else {
            _debugPrint("Driftwood internal error: found nil while update constraint '\(_type(of:key))'.")
            return
        }
        
        if let constant = constant {
            con.constant = constant
        }
        
        if let priority = priority {
            con.isActive = false
            con.priority = priority
            con.isActive = true
        }
    }
    
    /// deactivate a constraint installed by driftwood
    @discardableResult
    func deactivate(for key: Attribute) -> LayoutConstraint? {
        // check if there was an constraint
        guard let con = self._activeConstraints.removeValue(forKey: key) else {
            _debugPrint("Driftwood internal error: found nil while deactivate constraint '\(_type(of:key))'")
            return nil
        }
        
        con.isActive = false
        return con
    }
    
    /// deactivate all constraints installed by driftwood
    func deactivateAll() {
        self._activeConstraints.forEach({ $1.isActive = false })
        self._activeConstraints = [:]
    }
    
    /// dequeue a constraint cached by driftwood
    func deququeConstraintFor(item: ConstraintItem, attribute: Attribute, relation: Relation, toItem: ConstraintItem?, toAttribute: Attribute, multiply: CGFloat, constant: CGFloat, priority: Priority) -> LayoutConstraint {
        // 0. generate a constraint hash value (hash calculation not include item/constant/priority)
        var hasher = Hasher()
        hasher.combine(attribute)
        hasher.combine(toItem?.dw_hashValue)
        hasher.combine(toAttribute)
        hasher.combine(relation)
        hasher.combine(multiply)
        let conKey = hasher.finalize()
        
        // 1. retrive a constraint from cache, if any
        let con: LayoutConstraint
        if let c = self._cachedConstraints[conKey] {
            // 1.1 cached
            con = c
            
            // check if cached constraint is 'active'
            assert(con.isActive == false, "Driftwood internal error: found 'active' while dequeue a cached constraint '\(_type(of:attribute))'.")
            
            con.constant = constant
            con.priority = priority
        } else {
            // 1.2 no cache
            con = LayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: toItem, attribute: toAttribute, multiplier: multiply, constant: constant)
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
    private var _activeConstraints: [Attribute: LayoutConstraint] = [:]
    
    /// cached constraints (include active/deactive constraints)
    private var _cachedConstraints: [Int: LayoutConstraint] = [:]
}
