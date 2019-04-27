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
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @discardableResult
    public func leftMargin() -> ConstraintRemover {
        return self._remove(for: .leftMargin)
    }
    
    /// rightMargin
    @discardableResult
    public func rightMargin() -> ConstraintRemover {
        return self._remove(for: .rightMargin)
    }
    
    /// leadingMargin
    @discardableResult
    public func leadingMargin() -> ConstraintRemover {
        return self._remove(for: .leadingMargin)
    }
    
    /// trailingMargin
    @discardableResult
    public func trailingMargin() -> ConstraintRemover {
        return self._remove(for: .trailingMargin)
    }
    
    /// centerXWithinMargins
    @discardableResult
    public func centerXWithinMargins() -> ConstraintRemover {
        return self._remove(for: .centerXWithinMargins)
    }
    #endif
    
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
    @discardableResult
    public func firstBaseline() -> ConstraintRemover {
        return self._remove(for: .firstBaseline)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @discardableResult
    public func topMargin() -> ConstraintRemover {
        return self._remove(for: .topMargin)
    }
    
    /// bottomMargin
    @discardableResult
    public func bottomMargin() -> ConstraintRemover {
        return self._remove(for: .bottomMargin)
    }
    
    /// centerYWithinMargins
    @discardableResult
    public func centerYWithinMargins() -> ConstraintRemover {
        return self._remove(for: .centerYWithinMargins)
    }
    #endif
    
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
    // Internal
    //===========================================
    //
    /// init
    init(item: ConstraintItem, location: Debug.Location) {
        self._item = item
        self._location = location
    }
    
    //===========================================
    // Private
    //===========================================
    //
    /// remove constraint
    @discardableResult
    private func _remove(for attribute: Attribute) -> ConstraintRemover {
        // 0. deactivate a constraint installed by driftwood if any
        guard let _ = self._item.storage.deactivate(for: attribute) else {
            Debug.log(self._location, .remove(attribute), self._item, message: "No constraint.")
            return self
        }
        
        // 1. return self
        return self
    }
    
    /// item
    private let _item: ConstraintItem
    
    /// location
    private let _location: Debug.Location
}
