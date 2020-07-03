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
    
    /// remove all
    func removeAll() {
        ItemPair.anyStorage(for: self.subject.item)?.deactivateAll()
    }
    
    /// remake
    func remake(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        self.removeAll()
        return ConstraintMaker(self.subject, location: Debug.Location(file, line), labeled: name)
    }
}


/// Wood (Attribute)
public extension Wood where Subject == ItemPair {
    
    // MARK: -
    // MARK: HAttribute
    /// left
    @inlinable
    var left: HAttribute { .left(self.subject.item) }
    
    /// right
    @inlinable
    var right: HAttribute { .right(self.subject.item) }
    
    /// leading
    @inlinable
    var leading: HAttribute { .leading(self.subject.item) }
    
    /// trailing
    @inlinable
    var trailing: HAttribute { .trailing(self.subject.item) }
    
    /// centerX
    @inlinable
    var centerX: HAttribute { .centerX(self.subject.item) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @inlinable
    var leftMargin: HAttribute { .leftMargin(self.subject.item) }
    
    /// rightMargin
    @inlinable
    var rightMargin: HAttribute { .rightMargin(self.subject.item) }
    
    /// leadingMargin
    @inlinable
    var leadingMargin: HAttribute { .leadingMargin(self.subject.item) }
    
    /// trailingMargin
    @inlinable
    var trailingMargin: HAttribute { .trailingMargin(self.subject.item) }
    
    /// centerXWithinMargins
    @inlinable
    var centerXWithinMargins: HAttribute { .centerXWithinMargins(self.subject.item) }
    #endif
    
    // MARK: -
    // MARK: VAttribute
    /// top
    @inlinable
    var top: VAttribute { .top(self.subject.item) }
    
    /// bottom
    @inlinable
    var bottom: VAttribute { .bottom(self.subject.item) }
    
    /// centerY
    @inlinable
    var centerY: VAttribute { .centerY(self.subject.item) }
    
    /// lastBaseline
    @inlinable
    var lastBaseline: VAttribute { .lastBaseline(self.subject.item) }
    
    /// firstBaseline
    @inlinable
    var firstBaseline: VAttribute { .firstBaseline(self.subject.item) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @inlinable
    var topMargin: VAttribute { .topMargin(self.subject.item) }
    
    /// bottomMargin
    @inlinable
    var bottomMargin: VAttribute { .bottomMargin(self.subject.item) }
    
    /// centerYWithinMargins
    @inlinable
    var centerYWithinMargins: VAttribute { .centerYWithinMargins(self.subject.item) }
    #endif
    
    // MARK: -
    // MARK: SAttribute
    /// width
    @inlinable
    var width: SAttribute { .width(self.subject.item) }
    
    /// height
    @inlinable
    var height: SAttribute { .height(self.subject.item) }
}
