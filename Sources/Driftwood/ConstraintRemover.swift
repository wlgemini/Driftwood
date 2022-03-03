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
    
    // MARK: -
    // MARK: Remove horizontal constraint
    /// left
    @discardableResult
    public func left() -> Self {
        self._remove(attribute: .left)
    }
    
    /// right
    @discardableResult
    public func right() -> Self {
        self._remove(attribute: .right)
    }
    
    /// leading
    @discardableResult
    public func leading() -> Self {
        self._remove(attribute: .leading)
    }
    
    /// trailing
    @discardableResult
    public func trailing() -> Self {
        self._remove(attribute: .trailing)
    }
    
    /// centerX
    @discardableResult
    public func centerX() -> Self {
        self._remove(attribute: .centerX)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @discardableResult
    public func leftMargin() -> Self {
        self._remove(attribute: .leftMargin)
    }
    
    /// rightMargin
    @discardableResult
    public func rightMargin() -> Self {
        self._remove(attribute: .rightMargin)
    }
    
    /// leadingMargin
    @discardableResult
    public func leadingMargin() -> Self {
        self._remove(attribute: .leadingMargin)
    }
    
    /// trailingMargin
    @discardableResult
    public func trailingMargin() -> Self {
        self._remove(attribute: .trailingMargin)
    }
    
    /// centerXWithinMargins
    @discardableResult
    public func centerXWithinMargins() -> Self {
        self._remove(attribute: .centerXWithinMargins)
    }
    #endif
    
    // MARK: -
    // MARK: Remove vertical constraint
    /// top
    @discardableResult
    public func top() -> Self {
        self._remove(attribute: .top)
    }
    
    /// bottom
    @discardableResult
    public func bottom() -> Self {
        self._remove(attribute: .bottom)
    }
    
    /// centerY
    @discardableResult
    public func centerY() -> Self {
        self._remove(attribute: .centerY)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline() -> Self {
        self._remove(attribute: .lastBaseline)
    }
    
    /// firstBaseline
    @discardableResult
    public func firstBaseline() -> Self {
        self._remove(attribute: .firstBaseline)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @discardableResult
    public func topMargin() -> Self {
        self._remove(attribute: .topMargin)
    }
    
    /// bottomMargin
    @discardableResult
    public func bottomMargin() -> Self {
        self._remove(attribute: .bottomMargin)
    }
    
    /// centerYWithinMargins
    @discardableResult
    public func centerYWithinMargins() -> Self {
        self._remove(attribute: .centerYWithinMargins)
    }
    #endif
    
    // MARK: -
    // MARK: Remove size constraint
    /// width
    @discardableResult
    public func width() -> Self {
        self._remove(attribute: .width)
    }
    
    /// height
    @discardableResult
    public func height() -> Self {
        self._remove(attribute: .height)
    }
    
    // MARK: - Internal
    /// init
    init(item: Item, location: Debug.Location, labeled name: String?) {
        self._item = item
        self._storage = Storage.storage(for: item)
        self._location = location
        
        // set label
        if let nm = name {
            self._storage.labeledName = nm
        }
    }
    
    // MARK: - Private
    /// remove constraint
    @discardableResult
    private func _remove(attribute: Attribute) -> Self {
        // 0. deactivate a constraint installed by driftwood if any
        guard let _ = self._storage.deactivate(for: attribute) else {
            Debug.log(location: self._location, operation: .remove(attribute), item: self._item, message: "No constraint.")
            return self
        }
        
        // 1. return self
        return self
    }
    
    /// a `View/LayoutGuide`
    private unowned(unsafe) let _item: Item
    
    /// a `Storage`
    private unowned(unsafe) let _storage: Storage
    
    /// a `Location`
    private let _location: Debug.Location
}
