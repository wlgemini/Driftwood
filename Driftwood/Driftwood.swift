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


/// Driftwood
public struct Driftwood {
    
    /// init
    init(_ item: ConstraintItem) { self._item = item }
    
    /// item
    private let _item: ConstraintItem
}


/// Driftwood (Make, Update, Remove, Remake constraint)
extension Driftwood {
    
    /// make
    public func make(file: String = #file, line: UInt = #line) -> ConstraintMaker {
        return ConstraintMaker(item: self._item, location: Debug.Location(file, line))
    }
    
    /// update
    public func update(file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        return ConstraintUpdater(item: self._item, location: Debug.Location(file, line))
    }
    
    /// remove
    public func remove(file: String = #file, line: UInt = #line) -> ConstraintRemover {
        return ConstraintRemover(item: self._item, location: Debug.Location(file, line))
    }
    
    /// remake
    public func remake(file: String = #file, line: UInt = #line) -> ConstraintMaker {
        self._item.storage.deactivateAll()
        return ConstraintMaker(item: self._item, location: Debug.Location(file, line))
    }
}


/// Driftwood (ConstraintAttribute)
extension Driftwood {
    
    //===========================================
    // ConstraintAttributeX
    //===========================================
    //
    /// left
    public var left: ConstraintAttributeX { return .left(self._item) }
    
    /// right
    public var right: ConstraintAttributeX { return .right(self._item) }
    
    /// leading
    public var leading: ConstraintAttributeX { return .leading(self._item) }
    
    /// trailing
    public var trailing: ConstraintAttributeX { return .trailing(self._item) }
    
    /// centerX
    public var centerX: ConstraintAttributeX { return .centerX(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    public var leftMargin: ConstraintAttributeX { return .leftMargin(self._item) }
    
    /// rightMargin
    public var rightMargin: ConstraintAttributeX { return .rightMargin(self._item) }
    
    /// leadingMargin
    public var leadingMargin: ConstraintAttributeX { return .leadingMargin(self._item) }
    
    /// trailingMargin
    public var trailingMargin: ConstraintAttributeX { return .trailingMargin(self._item) }
    
    /// centerXWithinMargins
    public var centerXWithinMargins: ConstraintAttributeX { return .centerXWithinMargins(self._item) }
    #endif
    
    //===========================================
    // ConstraintAttributeY
    //===========================================
    //
    /// top
    public var top: ConstraintAttributeY { return .top(self._item) }
    
    /// bottom
    public var bottom: ConstraintAttributeY { return .bottom(self._item) }
    
    /// centerY
    public var centerY: ConstraintAttributeY { return .centerY(self._item) }
    
    /// lastBaseline
    public var lastBaseline: ConstraintAttributeY { return .lastBaseline(self._item) }
    
    /// firstBaseline
    public var firstBaseline: ConstraintAttributeY { return .firstBaseline(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    public var topMargin: ConstraintAttributeY { return .topMargin(self._item) }
    
    /// bottomMargin
    public var bottomMargin: ConstraintAttributeY { return .bottomMargin(self._item) }
    
    /// centerYWithinMargins
    public var centerYWithinMargins: ConstraintAttributeY { return .centerYWithinMargins(self._item) }
    #endif
    
    //===========================================
    // ConstraintAttributeSize
    //===========================================
    //
    /// width
    public var width: ConstraintAttributeSize { return .width(self._item) }
    
    /// height
    public var height: ConstraintAttributeSize { return .height(self._item) }
}


/// Driftwood (Debugging)
extension Driftwood {
    
    /// attaching a debug-label for current View/LayoutGuide
    public func labeled(_ lb: String) -> Driftwood {
        self._item.storage.labeled = lb
        return self
    }
}
