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


import Foundation


/// ConstraintMaker (Handy)
public extension ConstraintMaker {
    
    // MARK: -
    // MARK: Make horizontal constraint
    /// left to superview
    @inlinable
    @discardableResult
    func left(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.left(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// right to superview
    @inlinable
    @discardableResult
    func right(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.right(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// leading to superview
    @inlinable
    @discardableResult
    func leading(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.leading(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// trailing to superview
    @inlinable
    @discardableResult
    func trailing(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.trailing(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// centerX to superview
    @inlinable
    @discardableResult
    func centerX(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.centerX(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// leftMargin to superview
    @inlinable
    @discardableResult
    func leftMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.leftMargin(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// rightMargin to superview
    @inlinable
    @discardableResult
    func rightMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.rightMargin(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// leadingMargin to superview
    @inlinable
    @discardableResult
    func leadingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.leadingMargin(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// trailingMargin to superview
    @inlinable
    @discardableResult
    func trailingMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.trailingMargin(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// centerXWithinMargins to superview
    @inlinable
    @discardableResult
    func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.centerXWithinMargins(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    #endif
    
    // MARK: -
    // MARK: Make vertical constraint
    /// top to superview
    @inlinable
    @discardableResult
    func top(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.top(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// bottom to superview
    @inlinable
    @discardableResult
    func bottom(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.bottom(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// centerY to superview
    @inlinable
    @discardableResult
    func centerY(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.centerY(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// lastBaseline to superview
    @inlinable
    @discardableResult
    func lastBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.lastBaseline(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// firstBaseline to superview
    @inlinable
    @discardableResult
    func firstBaseline(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.firstBaseline(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    #if os(iOS) || os(tvOS)
    /// topMargin to superview
    @inlinable
    @discardableResult
    func topMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.topMargin(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// bottomMargin to superview
    @inlinable
    @discardableResult
    func bottomMargin(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.bottomMargin(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    
    /// centerYWithinMargins to superview
    @inlinable
    @discardableResult
    func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.centerYWithinMargins(constant, by: relation, to: .superview, multiply: multiply, priority: priority)
    }
    #endif
    
    // MARK: -
    // MARK: Make size constraint
    /// width
    @inlinable
    @discardableResult
    func width(by relation: Relation = Preferences.relation, to sAttribute: SAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.width(0.0, by: relation, to: sAttribute, multiply: multiply, priority: priority)
    }
    
    /// height
    @inlinable
    @discardableResult
    func height(by relation: Relation = Preferences.relation, to sAttribute: SAttribute, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.height(0.0, by: relation, to: sAttribute, multiply: multiply, priority: priority)
    }
    
    /// size
    @inlinable
    @discardableResult
    func size(by relation: Relation = Preferences.relation, to item: Item, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.width(0.0, by: relation, to: .width(item), multiply: multiply, priority: priority)
        self.height(0.0, by: relation, to: .height(item), multiply: multiply, priority: priority)
        return self
    }
    
    // MARK: -
    // MARK: Make horizontal & vertical constraint
    /// centerXY to superview
    @inlinable
    @discardableResult
    func centerXY(offsets: CGPoint, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.centerX(offsets.x, by: relation, to: .superview, multiply: multiply, priority: priority)
        self.centerY(offsets.y, by: relation, to: .superview, multiply: multiply, priority: priority)
        return self
    }
    
    /// centerXY
    @inlinable
    @discardableResult
    func centerXY(offsets: CGPoint, by relation: Relation = Preferences.relation, to item: Item, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.centerX(offsets.x, by: relation, to: .centerX(item), multiply: multiply, priority: priority)
        self.centerY(offsets.y, by: relation, to: .centerY(item), multiply: multiply, priority: priority)
        return self
    }
    
    /// edge to superview
    @inlinable
    @discardableResult
    func edge(insets: EdgeInsets, by relation: Relation = Preferences.relation, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.left(insets.left, by: relation, to: .superview, multiply: multiply, priority: priority)
        self.right(-insets.right, by: relation, to: .superview, multiply: multiply, priority: priority)
        self.top(insets.top, by: relation, to: .superview, multiply: multiply, priority: priority)
        self.bottom(-insets.bottom, by: relation, to: .superview, multiply: multiply, priority: priority)
        return self
    }
    
    /// edge
    @inlinable
    @discardableResult
    func edge(insets: EdgeInsets, by relation: Relation = Preferences.relation, to item: Item, multiply: CGFloat = Preferences.multiply, priority: Priority = Preferences.priority) -> Self {
        self.left(insets.left, by: relation, to: .left(item), multiply: multiply, priority: priority)
        self.right(-insets.right, by: relation, to: .right(item), multiply: multiply, priority: priority)
        self.top(insets.top, by: relation, to: .top(item), multiply: multiply, priority: priority)
        self.bottom(-insets.bottom, by: relation, to: .bottom(item), multiply: multiply, priority: priority)
        return self
    }
}
