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
/// EdgeInsets
public typealias EdgeInsets = UIEdgeInsets
#else
/// EdgeInsets
public typealias EdgeInsets = NSEdgeInsets
#endif


/// Constraint Maker (Handy)
extension ConstraintMaker {
    
    //===========================================
    // Make ConstraintAttributeX
    //===========================================
    //
    /// left to superview
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.left(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// right to superview
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.right(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// leading to superview
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.leading(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// trailing to superview
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.trailing(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerX to superview
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.centerX(constant, by: relation, to: .superview, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin to superview
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.leftMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// rightMargin to superview
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.rightMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// leadingMargin to superview
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.leadingMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// trailingMargin to superview
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.trailingMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerXWithinMargins to superview
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.centerXWithinMargins(constant, by: relation, to: .superview, priority: priority)
    }
    #endif
    
    //===========================================
    // Make ConstraintAttributeY
    //===========================================
    //
    /// top to superview
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.top(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// bottom to superview
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.bottom(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerY to superview
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.centerY(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// lastBaseline to superview
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.lastBaseline(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// firstBaseline to superview
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.firstBaseline(constant, by: relation, to: .superview, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin to superview
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.topMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// bottomMargin to superview
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.bottomMargin(constant, by: relation, to: .superview, priority: priority)
    }
    
    /// centerYWithinMargins to superview
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        return self.centerYWithinMargins(constant, by: relation, to: .superview, priority: priority)
    }
    #endif
    
    //===========================================
    // Make ConstraintAttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(by relation: Relation = .equal, to attribute: ConstraintAttributeSize, multiply: CGFloat = 1, priority: Priority = .required) -> ConstraintMaker {
        return self.width(0, by: relation, to: attribute, multiply: multiply, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(by relation: Relation = .equal, to attribute: ConstraintAttributeSize, multiply: CGFloat = 1, priority: Priority = .required) -> ConstraintMaker {
        return self.height(0, by: relation, to: attribute, multiply: multiply, priority: priority)
    }
    
    /// size
    @discardableResult
    public func size(by relation: Relation = .equal, to item: ConstraintItem, multiply: CGFloat = 1, priority: Priority = .required) -> ConstraintMaker {
        self.width(0, by: relation, to: .width(item), multiply: multiply, priority: priority)
        self.height(0, by: relation, to: .height(item), multiply: multiply, priority: priority)
        return self
    }
    
    //===========================================
    // Make ConstraintAttributeX & ConstraintAttributeY
    //===========================================
    //
    /// centerXY to superview
    @discardableResult
    public func centerXY(offsets: CGPoint, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        self.centerX(offsets.x, by: relation, to: .superview, priority: priority)
        self.centerY(offsets.y, by: relation, to: .superview, priority: priority)
        return self
    }
    
    /// centerXY
    @discardableResult
    public func centerXY(offsets: CGPoint, by relation: Relation = .equal, to item: ConstraintItem, priority: Priority = .required) -> ConstraintMaker {
        self.centerX(offsets.x, by: relation, to: .centerX(item), priority: priority)
        self.centerY(offsets.y, by: relation, to: .centerY(item), priority: priority)
        return self
    }
    
    /// edge to superview
    @discardableResult
    public func edge(insets: EdgeInsets, by relation: Relation = .equal, priority: Priority = .required) -> ConstraintMaker {
        self.leading(insets.left, by: relation, to: .superview, priority: priority)
        self.trailing(-insets.right, by: relation, to: .superview, priority: priority)
        self.top(insets.top, by: relation, to: .superview, priority: priority)
        self.bottom(-insets.bottom, by: relation, to: .superview, priority: priority)
        return self
    }
    
    /// edge
    @discardableResult
    public func edge(insets: EdgeInsets, by relation: Relation = .equal, to item: ConstraintItem, priority: Priority = .required) -> ConstraintMaker {
        self.leading(insets.left, by: relation, to: .leading(item), priority: priority)
        self.trailing(-insets.right, by: relation, to: .trailing(item), priority: priority)
        self.top(insets.top, by: relation, to: .top(item), priority: priority)
        self.bottom(-insets.bottom, by: relation, to: .bottom(item), priority: priority)
        return self
    }
}
