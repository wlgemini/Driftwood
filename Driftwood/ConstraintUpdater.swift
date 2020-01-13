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


/// ConstraintUpdater
public struct ConstraintUpdater {
    
    //===========================================
    // Update AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .left, constant: constant, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .right, constant: constant, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .leading, constant: constant, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .trailing, constant: constant, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .centerX, constant: constant, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @discardableResult
    public func leftMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .leftMargin, constant: constant, priority: priority)
    }
    
    /// rightMargin
    @discardableResult
    public func rightMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .rightMargin, constant: constant, priority: priority)
    }
    
    /// leadingMargin
    @discardableResult
    public func leadingMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .leadingMargin, constant: constant, priority: priority)
    }
    
    /// trailingMargin
    @discardableResult
    public func trailingMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .trailingMargin, constant: constant, priority: priority)
    }
    
    /// centerXWithinMargins
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .centerXWithinMargins, constant: constant, priority: priority)
    }
    #endif
    
    //===========================================
    // Update AttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .top, constant: constant, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .bottom, constant: constant, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .centerY, constant: constant, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .lastBaseline, constant: constant, priority: priority)
    }
    
    /// firstBaseline
    @discardableResult
    public func firstBaseline(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .firstBaseline, constant: constant, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @discardableResult
    public func topMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .topMargin, constant: constant, priority: priority)
    }
    
    /// bottomMargin
    @discardableResult
    public func bottomMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .bottomMargin, constant: constant, priority: priority)
    }
    
    /// centerYWithinMargins
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .centerYWithinMargins, constant: constant, priority: priority)
    }
    #endif
    
    //===========================================
    // Update AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .width, constant: constant, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        self._update(for: .height, constant: constant, priority: priority)
    }
    
    //===========================================
    // Internal
    //===========================================
    //
    /// init
    init(item: Item, location: Debug.Location, labeled name: String?) {
        self._item = item
        self._storage = item.storage
        self._location = location
        if let nm = name {
            self._storage.labeledName = nm
        }
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// update constraint
    @discardableResult
    private func _update(for attribute: Attribute, constant: CGFloat?, priority: Priority?) -> Self {
        // 0. check if there was a constraint already installed by driftwood
        guard let con = self._storage.activeConstraint(for: attribute) else {
            Debug.log(self._location, .update(attribute), self._item, message: "No constraint.")
            return self
        }
        
        // 1. update this constraint
        self._storage.update(con, constant: constant, priority: priority, location: self._location, operation: .update(attribute))
        
        // 2. return self
        return self
    }
    
    /// item
    private unowned(safe) let _item: Item
    
    /// storage
    private unowned(safe) let _storage: Storage
    
    /// location
    private let _location: Debug.Location
}
