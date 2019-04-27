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
public extension Driftwood {
    
    /// make
    func make(file: String = #file, line: UInt = #line) -> ConstraintMaker {
        return ConstraintMaker(item: self._item, location: Debug.Location(file, line))
    }
    
    /// update
    func update(file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        return ConstraintUpdater(item: self._item, location: Debug.Location(file, line))
    }
    
    /// remove
    func remove(file: String = #file, line: UInt = #line) -> ConstraintRemover {
        return ConstraintRemover(item: self._item, location: Debug.Location(file, line))
    }
    
    /// remake
    func remake(file: String = #file, line: UInt = #line) -> ConstraintMaker {
        self._item.storage.deactivateAll()
        return ConstraintMaker(item: self._item, location: Debug.Location(file, line))
    }
}


/// Driftwood (ConstraintAttribute)
public extension Driftwood {
    
    //===========================================
    // ConstraintAttributeX
    //===========================================
    //
    /// left
    var left: ConstraintAttributeX { return .left(self._item) }
    
    /// right
    var right: ConstraintAttributeX { return .right(self._item) }
    
    /// leading
    var leading: ConstraintAttributeX { return .leading(self._item) }
    
    /// trailing
    var trailing: ConstraintAttributeX { return .trailing(self._item) }
    
    /// centerX
    var centerX: ConstraintAttributeX { return .centerX(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    var leftMargin: ConstraintAttributeX { return .leftMargin(self._item) }
    
    /// rightMargin
    var rightMargin: ConstraintAttributeX { return .rightMargin(self._item) }
    
    /// leadingMargin
    var leadingMargin: ConstraintAttributeX { return .leadingMargin(self._item) }
    
    /// trailingMargin
    var trailingMargin: ConstraintAttributeX { return .trailingMargin(self._item) }
    
    /// centerXWithinMargins
    var centerXWithinMargins: ConstraintAttributeX { return .centerXWithinMargins(self._item) }
    #endif
    
    //===========================================
    // ConstraintAttributeY
    //===========================================
    //
    /// top
    var top: ConstraintAttributeY { return .top(self._item) }
    
    /// bottom
    var bottom: ConstraintAttributeY { return .bottom(self._item) }
    
    /// centerY
    var centerY: ConstraintAttributeY { return .centerY(self._item) }
    
    /// lastBaseline
    var lastBaseline: ConstraintAttributeY { return .lastBaseline(self._item) }
    
    /// firstBaseline
    var firstBaseline: ConstraintAttributeY { return .firstBaseline(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    var topMargin: ConstraintAttributeY { return .topMargin(self._item) }
    
    /// bottomMargin
    var bottomMargin: ConstraintAttributeY { return .bottomMargin(self._item) }
    
    /// centerYWithinMargins
    var centerYWithinMargins: ConstraintAttributeY { return .centerYWithinMargins(self._item) }
    #endif
    
    //===========================================
    // ConstraintAttributeSize
    //===========================================
    //
    /// width
    var width: ConstraintAttributeSize { return .width(self._item) }
    
    /// height
    var height: ConstraintAttributeSize { return .height(self._item) }
}


/// Driftwood (Debugging)
public extension Driftwood {
    
    /// attaching a debug-label for current View/LayoutGuide
    @discardableResult
    func labeled(_ lb: String) -> Driftwood {
        self._item.storage.labeled = lb
        return self
    }
}
