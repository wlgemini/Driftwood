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
public extension Wood where Subject: __Tuple2, Subject.Second: View {
    
    /// make
    func make(labeled name: String? = nil, file: String = #fileID, line: UInt = #line) -> ConstraintMaker {
        ConstraintMaker(item: self.subject.first, superview: self.subject.second, location: Debug.Location(file, line), labeled: name)
    }
    
    /// update
    func update(labeled name: String? = nil, file: String = #fileID, line: UInt = #line) -> ConstraintUpdater {
        ConstraintUpdater(item: self.subject.first, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove
    func remove(labeled name: String? = nil, file: String = #fileID, line: UInt = #line) -> ConstraintRemover {
        ConstraintRemover(item: self.subject.first, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove all
    func removeAll() {
        Storage.anyStorage(for: self.subject.first)?.deactivateAll()
    }
    
    /// remake
    func remake(labeled name: String? = nil, file: String = #fileID, line: UInt = #line) -> ConstraintMaker {
        self.removeAll()
        return ConstraintMaker(item: self.subject.first, superview: self.subject.second, location: Debug.Location(file, line), labeled: name)
    }
}


/// Wood (Make, Update, Remove constraint without argument `labeled:`)
public extension Wood where Subject: __Tuple2, Subject.Second: View {
    
    /// make
    @inlinable
    func make(file: String = #fileID, line: UInt = #line) -> ConstraintMaker {
        self.make(labeled: nil, file: file, line: line)
    }
    
    /// update
    @inlinable
    func update(file: String = #fileID, line: UInt = #line) -> ConstraintUpdater {
        self.update(labeled: nil, file: file, line: line)
    }
    
    /// remove
    @inlinable
    func remove(file: String = #fileID, line: UInt = #line) -> ConstraintRemover {
        self.remove(labeled: nil, file: file, line: line)
    }
    
    /// remake
    @inlinable
    func remake(file: String = #fileID, line: UInt = #line) -> ConstraintMaker {
        self.remake(labeled: nil, file: file, line: line)
    }
}


/// Wood (Attribute)
public extension Wood where Subject: __Tuple2, Subject.Second: View {
    
    // MARK: HAttribute
    /// left
    @inlinable
    var left: HAttribute { .left(self.subject.first) }
    
    /// right
    @inlinable
    var right: HAttribute { .right(self.subject.first) }
    
    /// leading
    @inlinable
    var leading: HAttribute { .leading(self.subject.first) }
    
    /// trailing
    @inlinable
    var trailing: HAttribute { .trailing(self.subject.first) }
    
    /// centerX
    @inlinable
    var centerX: HAttribute { .centerX(self.subject.first) }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin
    @inlinable
    var leftMargin: HAttribute { .leftMargin(self.subject.first) }
    
    /// rightMargin
    @inlinable
    var rightMargin: HAttribute { .rightMargin(self.subject.first) }
    
    /// leadingMargin
    @inlinable
    var leadingMargin: HAttribute { .leadingMargin(self.subject.first) }
    
    /// trailingMargin
    @inlinable
    var trailingMargin: HAttribute { .trailingMargin(self.subject.first) }
    
    /// centerXWithinMargins
    @inlinable
    var centerXWithinMargins: HAttribute { .centerXWithinMargins(self.subject.first) }
    #endif
    
    // MARK: VAttribute
    /// top
    @inlinable
    var top: VAttribute { .top(self.subject.first) }
    
    /// bottom
    @inlinable
    var bottom: VAttribute { .bottom(self.subject.first) }
    
    /// centerY
    @inlinable
    var centerY: VAttribute { .centerY(self.subject.first) }
    
    /// lastBaseline
    @inlinable
    var lastBaseline: VAttribute { .lastBaseline(self.subject.first) }
    
    /// firstBaseline
    @inlinable
    var firstBaseline: VAttribute { .firstBaseline(self.subject.first) }
    
    #if os(iOS) || os(tvOS)
    /// topMargin
    @inlinable
    var topMargin: VAttribute { .topMargin(self.subject.first) }
    
    /// bottomMargin
    @inlinable
    var bottomMargin: VAttribute { .bottomMargin(self.subject.first) }
    
    /// centerYWithinMargins
    @inlinable
    var centerYWithinMargins: VAttribute { .centerYWithinMargins(self.subject.first) }
    #endif
    
    // MARK: SAttribute
    /// width
    @inlinable
    var width: SAttribute { .width(self.subject.first) }
    
    /// height
    @inlinable
    var height: SAttribute { .height(self.subject.first) }
}


/// Wood (ContentHugging/ContentCompressionResistance priority)
public extension Wood where Subject: __Tuple2, Subject.First: View, Subject.Second: View {
    
    // MARK: Getter
    @inlinable
    var contentHuggingHorizontalPriority: Priority {
        self.subject.first.contentHuggingPriority(for: .horizontal)
    }
    
    @inlinable
    var contentHuggingVerticalPriority: Priority {
        self.subject.first.contentHuggingPriority(for: .vertical)
    }
    
    @inlinable
    var contentCompressionResistanceHorizontalPriority: Priority {
        self.subject.first.contentCompressionResistancePriority(for: .horizontal)
    }
    
    @inlinable
    var contentCompressionResistanceVerticalPriority: Priority {
        self.subject.first.contentCompressionResistancePriority(for: .vertical)
    }
    
    // MARK: Setter
    @inlinable
    @discardableResult
    func setContentHuggingHorizontalPriority(_ priority: Priority) -> Self {
        self.subject.first.setContentHuggingPriority(priority, for: .horizontal)
        return self
    }
    
    @inlinable
    @discardableResult
    func setContentHuggingVerticalPriority(_ priority: Priority) -> Self {
        self.subject.first.setContentHuggingPriority(priority, for: .vertical)
        return self
    }
    
    @inlinable
    @discardableResult
    func setContentCompressionResistanceHorizontalPriority(_ priority: Priority) -> Self {
        self.subject.first.setContentCompressionResistancePriority(priority, for: .horizontal)
        return self
    }
    
    @inlinable
    @discardableResult
    func setContentCompressionResistanceVerticalPriority(_ priority: Priority) -> Self {
        self.subject.first.setContentCompressionResistancePriority(priority, for: .vertical)
        return self
    }
}
