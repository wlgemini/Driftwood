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


/// Driftwood
public struct Driftwood {
    
    /// init
    init(_ item: ConstraintItem) { self._item = item }
    
    /// item
    private unowned(safe) let _item: ConstraintItem
}


/// Driftwood (Make, Update, Remove, Remake constraint)
public extension Driftwood {
    
    /// make
    func make(file: String = #file, line: UInt = #line) -> ConstraintMaker {
        ConstraintMaker(item: self._item, location: Debug.Location(file, line))
    }
    
    /// update
    func update(file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        ConstraintUpdater(item: self._item, location: Debug.Location(file, line))
    }
    
    /// remove
    func remove(file: String = #file, line: UInt = #line) -> ConstraintRemover {
        ConstraintRemover(item: self._item, location: Debug.Location(file, line))
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
    var left: ConstraintAttributeX { .left(self._item) }
    
    /// right
    var right: ConstraintAttributeX { .right(self._item) }
    
    /// leading
    var leading: ConstraintAttributeX { .leading(self._item) }
    
    /// trailing
    var trailing: ConstraintAttributeX { .trailing(self._item) }
    
    /// centerX
    var centerX: ConstraintAttributeX { .centerX(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    var leftMargin: ConstraintAttributeX { .leftMargin(self._item) }
    
    /// rightMargin
    var rightMargin: ConstraintAttributeX { .rightMargin(self._item) }
    
    /// leadingMargin
    var leadingMargin: ConstraintAttributeX { .leadingMargin(self._item) }
    
    /// trailingMargin
    var trailingMargin: ConstraintAttributeX { .trailingMargin(self._item) }
    
    /// centerXWithinMargins
    var centerXWithinMargins: ConstraintAttributeX { .centerXWithinMargins(self._item) }
    #endif
    
    //===========================================
    // ConstraintAttributeY
    //===========================================
    //
    /// top
    var top: ConstraintAttributeY { .top(self._item) }
    
    /// bottom
    var bottom: ConstraintAttributeY { .bottom(self._item) }
    
    /// centerY
    var centerY: ConstraintAttributeY { .centerY(self._item) }
    
    /// lastBaseline
    var lastBaseline: ConstraintAttributeY { .lastBaseline(self._item) }
    
    /// firstBaseline
    var firstBaseline: ConstraintAttributeY { .firstBaseline(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    var topMargin: ConstraintAttributeY { .topMargin(self._item) }
    
    /// bottomMargin
    var bottomMargin: ConstraintAttributeY { .bottomMargin(self._item) }
    
    /// centerYWithinMargins
    var centerYWithinMargins: ConstraintAttributeY { .centerYWithinMargins(self._item) }
    #endif
    
    //===========================================
    // ConstraintAttributeSize
    //===========================================
    //
    /// width
    var width: ConstraintAttributeSize { .width(self._item) }
    
    /// height
    var height: ConstraintAttributeSize { .height(self._item) }
}


/// Driftwood (Debugging)
public extension Driftwood {
    
    /// attaching a debug-label for current View/LayoutGuide
    @discardableResult
    func labeled(_ lb: String) -> Self {
        self._item.storage.labeled = lb
        return self
    }
}
