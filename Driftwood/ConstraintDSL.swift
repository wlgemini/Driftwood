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


/// ConstraintDSL
public struct ConstraintDSL {
    
    /// init
    init(_ item: Item) { self._item = item }
    
    /// item
    private unowned(safe) let _item: Item
}


/// ConstraintDSL (Make, Update, Remove, Remake constraint)
public extension ConstraintDSL {
    
    /// make
    func make(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        ConstraintMaker(item: self._item, location: Debug.Location(file, line), labeled: name)
    }
    
    /// update
    func update(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        ConstraintUpdater(item: self._item, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove
    func remove(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintRemover {
        ConstraintRemover(item: self._item, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remake
    func remake(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        self._item.storage.deactivateAll()
        return ConstraintMaker(item: self._item, location: Debug.Location(file, line), labeled: name)
    }
}


/// ConstraintDSL (Attribute)
public extension ConstraintDSL {
    
    //===========================================
    // AttributeX
    //===========================================
    //
    /// left
    var left: AttributeX { .left(self._item) }
    
    /// right
    var right: AttributeX { .right(self._item) }
    
    /// leading
    var leading: AttributeX { .leading(self._item) }
    
    /// trailing
    var trailing: AttributeX { .trailing(self._item) }
    
    /// centerX
    var centerX: AttributeX { .centerX(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    var leftMargin: AttributeX { .leftMargin(self._item) }
    
    /// rightMargin
    var rightMargin: AttributeX { .rightMargin(self._item) }
    
    /// leadingMargin
    var leadingMargin: AttributeX { .leadingMargin(self._item) }
    
    /// trailingMargin
    var trailingMargin: AttributeX { .trailingMargin(self._item) }
    
    /// centerXWithinMargins
    var centerXWithinMargins: AttributeX { .centerXWithinMargins(self._item) }
    #endif
    
    //===========================================
    // AttributeY
    //===========================================
    //
    /// top
    var top: AttributeY { .top(self._item) }
    
    /// bottom
    var bottom: AttributeY { .bottom(self._item) }
    
    /// centerY
    var centerY: AttributeY { .centerY(self._item) }
    
    /// lastBaseline
    var lastBaseline: AttributeY { .lastBaseline(self._item) }
    
    /// firstBaseline
    var firstBaseline: AttributeY { .firstBaseline(self._item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    var topMargin: AttributeY { .topMargin(self._item) }
    
    /// bottomMargin
    var bottomMargin: AttributeY { .bottomMargin(self._item) }
    
    /// centerYWithinMargins
    var centerYWithinMargins: AttributeY { .centerYWithinMargins(self._item) }
    #endif
    
    //===========================================
    // AttributeSize
    //===========================================
    //
    /// width
    var width: AttributeSize { .width(self._item) }
    
    /// height
    var height: AttributeSize { .height(self._item) }
}
