//
//  Wood+Constraint.swift
//  Driftwood
//
//  Created by wlgemini on 2020/7/2.
//


/// ConstraintDSL (Make, Update, Remove constraint)
public extension Wood where Subject == ItemPair {
    
    /// make
    func make(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintMaker {
        ConstraintMaker(dsl: self.subject, location: Debug.Location(file, line), labeled: name)
    }
    
    /// update
    func update(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintUpdater {
        ConstraintUpdater(dsl: self, location: Debug.Location(file, line), labeled: name)
    }
    
    /// remove
    func remove(labeled name: String? = nil, file: String = #file, line: UInt = #line) -> ConstraintRemover {
        ConstraintRemover(dsl: self, location: Debug.Location(file, line), labeled: name)
    }
}


/// ConstraintDSL (Attribute)
public extension Wood where Subject == ItemPair {
    
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
