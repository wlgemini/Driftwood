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
public struct ConstraintDSL<T: Item> {
    
    /// item
    public unowned(safe) let item: T
}


/// ConstraintDSL (Make, Update, Remove, Remake constraint)
public extension ConstraintDSL {
    
    /// make
    func make(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        ConstraintMaker(item: self.item, location: Debug.Location(file, line), labeled: name)
    }
    
    /// update
    func update(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        ConstraintUpdater(item: self.item, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove
    func remove(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintRemover {
        ConstraintRemover(item: self.item, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remake
    func remake(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        self.item.storage.deactivateAll()
        return ConstraintMaker(item: self.item, location: Debug.Location(file, line), labeled: name)
    }
}


/// ConstraintDSL (Attribute)
public extension ConstraintDSL {
    
    //===========================================
    // AttributeX
    //===========================================
    //
    /// left
    @inlinable
    var left: AttributeX { .left(self.item) }
    
    /// right
    @inlinable
    var right: AttributeX { .right(self.item) }
    
    /// leading
    @inlinable
    var leading: AttributeX { .leading(self.item) }
    
    /// trailing
    @inlinable
    var trailing: AttributeX { .trailing(self.item) }
    
    /// centerX
    @inlinable
    var centerX: AttributeX { .centerX(self.item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @inlinable
    var leftMargin: AttributeX { .leftMargin(self.item) }
    
    /// rightMargin
    @inlinable
    var rightMargin: AttributeX { .rightMargin(self.item) }
    
    /// leadingMargin
    @inlinable
    var leadingMargin: AttributeX { .leadingMargin(self.item) }
    
    /// trailingMargin
    @inlinable
    var trailingMargin: AttributeX { .trailingMargin(self.item) }
    
    /// centerXWithinMargins
    @inlinable
    var centerXWithinMargins: AttributeX { .centerXWithinMargins(self.item) }
    #endif
    
    //===========================================
    // AttributeY
    //===========================================
    //
    /// top
    @inlinable
    var top: AttributeY { .top(self.item) }
    
    /// bottom
    @inlinable
    var bottom: AttributeY { .bottom(self.item) }
    
    /// centerY
    @inlinable
    var centerY: AttributeY { .centerY(self.item) }
    
    /// lastBaseline
    @inlinable
    var lastBaseline: AttributeY { .lastBaseline(self.item) }
    
    /// firstBaseline
    @inlinable
    var firstBaseline: AttributeY { .firstBaseline(self.item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @inlinable
    var topMargin: AttributeY { .topMargin(self.item) }
    
    /// bottomMargin
    @inlinable
    var bottomMargin: AttributeY { .bottomMargin(self.item) }
    
    /// centerYWithinMargins
    @inlinable
    var centerYWithinMargins: AttributeY { .centerYWithinMargins(self.item) }
    #endif
    
    //===========================================
    // AttributeSize
    //===========================================
    //
    /// width
    @inlinable
    var width: AttributeSize { .width(self.item) }
    
    /// height
    @inlinable
    var height: AttributeSize { .height(self.item) }
}
