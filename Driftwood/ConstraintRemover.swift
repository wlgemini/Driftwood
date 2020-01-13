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


/// ConstraintRemover
public struct ConstraintRemover {
    
    //===========================================
    // Remove AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left() -> Self {
        self._remove(for: .left)
    }
    
    /// right
    @discardableResult
    public func right() -> Self {
        self._remove(for: .right)
    }
    
    /// leading
    @discardableResult
    public func leading() -> Self {
        self._remove(for: .leading)
    }
    
    /// trailing
    @discardableResult
    public func trailing() -> Self {
        self._remove(for: .trailing)
    }
    
    /// centerX
    @discardableResult
    public func centerX() -> Self {
        self._remove(for: .centerX)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @discardableResult
    public func leftMargin() -> Self {
        self._remove(for: .leftMargin)
    }
    
    /// rightMargin
    @discardableResult
    public func rightMargin() -> Self {
        self._remove(for: .rightMargin)
    }
    
    /// leadingMargin
    @discardableResult
    public func leadingMargin() -> Self {
        self._remove(for: .leadingMargin)
    }
    
    /// trailingMargin
    @discardableResult
    public func trailingMargin() -> Self {
        self._remove(for: .trailingMargin)
    }
    
    /// centerXWithinMargins
    @discardableResult
    public func centerXWithinMargins() -> Self {
        self._remove(for: .centerXWithinMargins)
    }
    #endif
    
    //===========================================
    // Remove AttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top() -> Self {
        self._remove(for: .top)
    }
    
    /// bottom
    @discardableResult
    public func bottom() -> Self {
        self._remove(for: .bottom)
    }
    
    /// centerY
    @discardableResult
    public func centerY() -> Self {
        self._remove(for: .centerY)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline() -> Self {
        self._remove(for: .lastBaseline)
    }
    
    /// firstBaseline
    @discardableResult
    public func firstBaseline() -> Self {
        self._remove(for: .firstBaseline)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @discardableResult
    public func topMargin() -> Self {
        self._remove(for: .topMargin)
    }
    
    /// bottomMargin
    @discardableResult
    public func bottomMargin() -> Self {
        self._remove(for: .bottomMargin)
    }
    
    /// centerYWithinMargins
    @discardableResult
    public func centerYWithinMargins() -> Self {
        self._remove(for: .centerYWithinMargins)
    }
    #endif
    
    //===========================================
    // Remove AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width() -> Self {
        self._remove(for: .width)
    }
    
    /// height
    @discardableResult
    public func height() -> Self {
        self._remove(for: .height)
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
    /// remove constraint
    @discardableResult
    private func _remove(for attribute: Attribute) -> Self {
        // 0. deactivate a constraint installed by driftwood if any
        guard let _ = self._storage.deactivate(for: attribute) else {
            Debug.log(self._location, .remove(attribute), self._item, message: "No constraint.")
            return self
        }
        
        // 1. return self
        return self
    }
    
    /// item
    private unowned(safe) let _item: Item
    
    /// storage
    private unowned(safe) let _storage: Storage
    
    /// location
    private let _location: Debug.Location
}
