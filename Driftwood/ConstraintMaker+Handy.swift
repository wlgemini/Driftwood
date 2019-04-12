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


/// Constraint Maker (Handy)
public extension ConstraintMaker {
    
    //===========================================
    // Make ConstraintAttributeX
    //===========================================
    //
    /// left to superview
    @discardableResult
    func left(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.left(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// right to superview
    @discardableResult
    func right(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.right(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// leading to superview
    @discardableResult
    func leading(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.leading(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// trailing to superview
    @discardableResult
    func trailing(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.trailing(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerX to superview
    @discardableResult
    func centerX(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.centerX(constant, by: relation, to: .superview, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin to superview
    @discardableResult
    func leftMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.leftMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// rightMargin to superview
    @discardableResult
    func rightMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.rightMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// leadingMargin to superview
    @discardableResult
    func leadingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.leadingMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// trailingMargin to superview
    @discardableResult
    func trailingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.trailingMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerXWithinMargins to superview
    @discardableResult
    func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.centerXWithinMargins(constant, by: relation, to: .superview, priority: priority)
    }
    #endif
    
    //===========================================
    // Make ConstraintAttributeY
    //===========================================
    //
    /// top to superview
    @discardableResult
    func top(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.top(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// bottom to superview
    @discardableResult
    func bottom(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.bottom(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerY to superview
    @discardableResult
    func centerY(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.centerY(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// lastBaseline to superview
    @discardableResult
    func lastBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.lastBaseline(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// firstBaseline to superview
    @discardableResult
    func firstBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.firstBaseline(constant, by: relation, to: .superview, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin to superview
    @discardableResult
    func topMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.topMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// bottomMargin to superview
    @discardableResult
    func bottomMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.bottomMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerYWithinMargins to superview
    @discardableResult
    func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.centerYWithinMargins(constant, by: relation, to: .superview, priority: priority)
    }
    #endif
    
    //===========================================
    // Make ConstraintAttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    func width(by relation: Relation = Preferences.relation, to attributeSize: ConstraintAttributeSize, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.width(0.0, by: relation, to: attributeSize, multiply: multiply, priority: priority)
    }
    
    /// height
    @discardableResult
    func height(by relation: Relation = Preferences.relation, to attributeSize: ConstraintAttributeSize, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> ConstraintMaker {
        return self.height(0.0, by: relation, to: attributeSize, multiply: multiply, priority: priority)
    }
    
    /// size
    @discardableResult
    func size(by relation: Relation = Preferences.relation, to item: ConstraintItem, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> ConstraintMaker {
        self.width(0.0, by: relation, to: .width(item), multiply: multiply, priority: priority)
        self.height(0.0, by: relation, to: .height(item), multiply: multiply, priority: priority)
        return self
    }
    
    //===========================================
    // Make ConstraintAttributeX & ConstraintAttributeY
    //===========================================
    //
    /// centerXY to superview
    @discardableResult
    func centerXY(offsets: CGPoint, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        self.centerX(offsets.x, by: relation, to: .superview, priority: priority)
        self.centerY(offsets.y, by: relation, to: .superview, priority: priority)
        return self
    }
    
    /// centerXY
    @discardableResult
    func centerXY(offsets: CGPoint, by relation: Relation = Preferences.relation, to item: ConstraintItem, priority: Priority = Preferences.priority) -> ConstraintMaker {
        self.centerX(offsets.x, by: relation, to: .centerX(item), priority: priority)
        self.centerY(offsets.y, by: relation, to: .centerY(item), priority: priority)
        return self
    }
    
    /// edge to superview
    @discardableResult
    func edge(insets: EdgeInsets, by relation: Relation = Preferences.relation, priority: Priority = Preferences.priority) -> ConstraintMaker {
        self.leading(insets.left, by: relation, to: .superview, priority: priority)
        self.trailing(-insets.right, by: relation, to: .superview, priority: priority)
        self.top(insets.top, by: relation, to: .superview, priority: priority)
        self.bottom(-insets.bottom, by: relation, to: .superview, priority: priority)
        return self
    }
    
    /// edge
    @discardableResult
    func edge(insets: EdgeInsets, by relation: Relation = Preferences.relation, to item: ConstraintItem, priority: Priority = Preferences.priority) -> ConstraintMaker {
        self.leading(insets.left, by: relation, to: .leading(item), priority: priority)
        self.trailing(-insets.right, by: relation, to: .trailing(item), priority: priority)
        self.top(insets.top, by: relation, to: .top(item), priority: priority)
        self.bottom(-insets.bottom, by: relation, to: .bottom(item), priority: priority)
        return self
    }
}
