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


/// Wood (Make, Update, Remove constraint)
public extension Wood where Subject == ItemPair {
    
    /// make
    func make(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        ConstraintMaker(self.subject, location: Debug.Location(file, line), labeled: name)
    }
    
    /// update
    func update(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        ConstraintUpdater(self.subject, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove
    func remove(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintRemover {
        ConstraintRemover(self.subject, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remake
    func remake(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        ItemPair.anyStorage(for: self.subject.item)?.deactivateAll()
        return ConstraintMaker(self.subject, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove all
    func removeAll() {
        ItemPair.anyStorage(for: self.subject.item)?.deactivateAll()
    }
}


/// Wood (Attribute)
public extension Wood where Subject == ItemPair {
    
    //===========================================
    // AttributeX
    //===========================================
    //
    /// left
    @inlinable
    var left: AttributeX { .left(self.subject.item) }
    
    /// right
    @inlinable
    var right: AttributeX { .right(self.subject.item) }
    
    /// leading
    @inlinable
    var leading: AttributeX { .leading(self.subject.item) }
    
    /// trailing
    @inlinable
    var trailing: AttributeX { .trailing(self.subject.item) }
    
    /// centerX
    @inlinable
    var centerX: AttributeX { .centerX(self.subject.item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @inlinable
    var leftMargin: AttributeX { .leftMargin(self.subject.item) }
    
    /// rightMargin
    @inlinable
    var rightMargin: AttributeX { .rightMargin(self.subject.item) }
    
    /// leadingMargin
    @inlinable
    var leadingMargin: AttributeX { .leadingMargin(self.subject.item) }
    
    /// trailingMargin
    @inlinable
    var trailingMargin: AttributeX { .trailingMargin(self.subject.item) }
    
    /// centerXWithinMargins
    @inlinable
    var centerXWithinMargins: AttributeX { .centerXWithinMargins(self.subject.item) }
    #endif
    
    //===========================================
    // AttributeY
    //===========================================
    //
    /// top
    @inlinable
    var top: AttributeY { .top(self.subject.item) }
    
    /// bottom
    @inlinable
    var bottom: AttributeY { .bottom(self.subject.item) }
    
    /// centerY
    @inlinable
    var centerY: AttributeY { .centerY(self.subject.item) }
    
    /// lastBaseline
    @inlinable
    var lastBaseline: AttributeY { .lastBaseline(self.subject.item) }
    
    /// firstBaseline
    @inlinable
    var firstBaseline: AttributeY { .firstBaseline(self.subject.item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @inlinable
    var topMargin: AttributeY { .topMargin(self.subject.item) }
    
    /// bottomMargin
    @inlinable
    var bottomMargin: AttributeY { .bottomMargin(self.subject.item) }
    
    /// centerYWithinMargins
    @inlinable
    var centerYWithinMargins: AttributeY { .centerYWithinMargins(self.subject.item) }
    #endif
    
    //===========================================
    // AttributeSize
    //===========================================
    //
    /// width
    @inlinable
    var width: AttributeSize { .width(self.subject.item) }
    
    /// height
    @inlinable
    var height: AttributeSize { .height(self.subject.item) }
}
