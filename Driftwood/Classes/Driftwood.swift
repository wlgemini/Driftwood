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


import UIKit


/// DriftwoodBase
public protocol DriftwoodBase: class {
    
    /// superview
    var superview: UIView? { get }
    
    /// description
    var description: String { get }
}


/// UIView+DriftwoodBase
extension UIView: DriftwoodBase {}


/// UILayoutGuide+DriftwoodBase
@available(iOS 9.0, *)
extension UILayoutGuide: DriftwoodBase {
    
    /// superview
    public var superview: UIView? { return self.owningView }
}


/// Relation
public typealias Relation = NSLayoutRelation


/// Priority
public typealias Priority = UILayoutPriority


/// Horizontal attribute
public enum AttributeX {
    
    case left(base: DriftwoodBase)
    
    case right(base: DriftwoodBase)
    
    case leading(base: DriftwoodBase)
    
    case trailing(base: DriftwoodBase)
    
    case centerX(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case leftMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case rightMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case leadingMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case trailingMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case centerXWithinMargins(base: DriftwoodBase)
    
    fileprivate var _rawTupleValue: (NSLayoutAttribute, DriftwoodBase) {
        switch self {
        case .left(base: let view): return (.left, view)
        case .right(base: let view): return (.right, view)
        case .leading(base: let view): return (.leading, view)
        case .trailing(base: let view): return (.trailing, view)
        case .centerX(base: let view): return (.centerX, view)
        case .leftMargin(base: let view): return (.leftMargin, view)
        case .rightMargin(base: let view): return (.rightMargin, view)
        case .leadingMargin(base: let view): return (.leadingMargin, view)
        case .trailingMargin(base: let view): return (.trailingMargin, view)
        case .centerXWithinMargins(base: let view): return (.centerXWithinMargins, view)
        }
    }
}


/// Vertical attribute
public enum AttributeY {
    
    case top(base: DriftwoodBase)
    
    case bottom(base: DriftwoodBase)
    
    case centerY(base: DriftwoodBase)
    
    case lastBaseline(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case firstBaseline(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case topMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case bottomMargin(base: DriftwoodBase)
    
    @available(iOS 8.0, *)
    case centerYWithinMargins(base: DriftwoodBase)
    
    fileprivate var _rawTupleValue: (NSLayoutAttribute, DriftwoodBase) {
        switch self {
        case .top(base: let view): return (.top, view)
        case .bottom(base: let view): return (.bottom, view)
        case .centerY(base: let view): return (.centerY, view)
        case .lastBaseline(base: let view): return (.lastBaseline, view)
        case .firstBaseline(base: let view): return (.firstBaseline, view)
        case .topMargin(base: let view): return (.topMargin, view)
        case .bottomMargin(base: let view): return (.bottomMargin, view)
        case .centerYWithinMargins(base: let view): return (.centerYWithinMargins, view)
        }
    }
}


/// Size attribute
public enum AttributeSize {
    
    case width(base: DriftwoodBase)
    
    case height(base: DriftwoodBase)
    
    fileprivate var _rawTupleValue: (NSLayoutAttribute, DriftwoodBase) {
        switch self {
        case .width(base: let view): return (.width, view)
        case .height(base: let view): return (.height, view)
        }
    }
}


/// ConstraintOperator, Superclass for ConstraintMaker, ConstraintUpdater, ConstraintRemover
public class ConstraintOperator {
    
    /// driftwood
    fileprivate let _driftwood: Driftwood
    
    /// Init
    fileprivate init(driftwood: Driftwood) {
        self._driftwood = driftwood
    }
}


/// Constraint Maker
public final class ConstraintMaker: ConstraintOperator {
    
    //===========================================
    // Make AttributeX
    //===========================================
    //
    /// left to superview
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .left, constant: constant, by: relation, priority: priority)
    }
    
    /// left
    @discardableResult
    public func left(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .left, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// right to superview
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .right, constant: constant, by: relation, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .right, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leading to superview
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .leading, constant: constant, by: relation, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .leading, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// trailing to superview
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .trailing, constant: constant, by: relation, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .trailing, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerX to superview
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .centerX, constant: constant, by: relation, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .centerX, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leftMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .leftMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .leftMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// rightMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .rightMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .rightMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// leadingMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .leadingMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .leadingMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// trailingMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .trailingMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .trailingMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerXWithinMargins to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeXToSuperview(for: .centerXWithinMargins, constant: constant, by: relation, priority: priority)
    }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeX, priority: Priority = .required) -> Self {
        return self._makeX(for: .centerXWithinMargins, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    //===========================================
    // Make AttributeY
    //===========================================
    //
    /// top to superview
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .top, constant: constant, by: relation, priority: priority)
    }
    
    /// top
    @discardableResult
    public func top(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .top, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// bottom to superview
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .bottom, constant: constant, by: relation, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .bottom, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerY to superview
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .centerY, constant: constant, by: relation, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .centerY, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// lastBaseline to superview
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .lastBaseline, constant: constant, by: relation, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .lastBaseline, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// firstBaseline to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .firstBaseline, constant: constant, by: relation, priority: priority)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .firstBaseline, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// topMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .topMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .topMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// bottomMargin to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .bottomMargin, constant: constant, by: relation, priority: priority)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .bottomMargin, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    /// centerYWithinMargins to superview
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, priority: Priority = .required) -> Self {
        return self._makeYToSuperview(for: .centerYWithinMargins, constant: constant, by: relation, priority: priority)
    }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeY, priority: Priority = .required) -> Self {
        return self._makeY(for: .centerYWithinMargins, constant: constant, by: relation, to: attribute, priority: priority)
    }
    
    //===========================================
    // Make AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeSize? = nil, multiply: CGFloat = 1, priority: Priority = .required) -> Self {
        return self._makeSize(for: .width, constant: constant, by: relation, to: attribute, multiply: multiply, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat, by relation: Relation = .equal, to attribute: AttributeSize? = nil, multiply: CGFloat = 1, priority: Priority = .required) -> Self {
        return self._makeSize(for: .height, constant: constant, by: relation, to: attribute, multiply: multiply, priority: priority)
    }
    
    //===========================================
    // Private Make
    //===========================================
    //
    /// make attribute X to superview
    private func _makeXToSuperview(for attribute: NSLayoutAttribute, constant: CGFloat, by relation: Relation, priority: Priority) -> Self {
        guard let superview = self._driftwood._base.superview else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) have no superview !!!")
        }
        
        switch attribute {
        case .left: return self._makeX(for: attribute, constant: constant, by: relation, to: .left(base: superview), priority: priority)
        case .right: return self._makeX(for: attribute, constant: constant, by: relation, to: .right(base: superview), priority: priority)
        case .leading: return self._makeX(for: attribute, constant: constant, by: relation, to: .leading(base: superview), priority: priority)
        case .trailing: return self._makeX(for: attribute, constant: constant, by: relation, to: .trailing(base: superview), priority: priority)
        case .centerX: return self._makeX(for: attribute, constant: constant, by: relation, to: .centerX(base: superview), priority: priority)
        case .leftMargin: return self._makeX(for: attribute, constant: constant, by: relation, to: .leftMargin(base: superview), priority: priority)
        case .rightMargin: return self._makeX(for: attribute, constant: constant, by: relation, to: .rightMargin(base: superview), priority: priority)
        case .leadingMargin: return self._makeX(for: attribute, constant: constant, by: relation, to: .leadingMargin(base: superview), priority: priority)
        case .trailingMargin: return self._makeX(for: attribute, constant: constant, by: relation, to: .trailingMargin(base: superview), priority: priority)
        case .centerXWithinMargins: return self._makeX(for: attribute, constant: constant, by: relation, to: .centerXWithinMargins(base: superview), priority: priority)
        default: fatalError("Driftwood ConstraintMaker Error: make attribute \(attribute) is not belong to X-axis")
        }
    }
    
    /// make attribute X
    private func _makeX(for attribute: NSLayoutAttribute, constant: CGFloat, by relation: Relation, to attributeX: AttributeX, priority: Priority) -> Self {
        guard nil == self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) already have \(attribute) constraint !!!")
        }
        
        let (attrX, view) = attributeX._rawTupleValue
        let con = NSLayoutConstraint(item: self._driftwood._base, attribute: attribute, relatedBy: relation, toItem: view, attribute: attrX, multiplier: 1, constant: constant)
        con.priority = priority
        con.isActive = true
        self._driftwood._constraintsWapper.constraints[attribute] = con
        return self
    }
    
    /// make attribute Y to superview
    private func _makeYToSuperview(for attribute: NSLayoutAttribute, constant: CGFloat, by relation: Relation, priority: Priority) -> Self {
        guard let superview = self._driftwood._base.superview else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) have no superview !!!")
        }
        
        switch attribute {
        case .top: return self._makeY(for: attribute, constant: constant, by: relation, to: .top(base: superview), priority: priority)
        case .bottom: return self._makeY(for: attribute, constant: constant, by: relation, to: .bottom(base: superview), priority: priority)
        case .centerY: return self._makeY(for: attribute, constant: constant, by: relation, to: .centerY(base: superview), priority: priority)
        case .lastBaseline: return self._makeY(for: attribute, constant: constant, by: relation, to: .lastBaseline(base: superview), priority: priority)
        case .firstBaseline: return self._makeY(for: attribute, constant: constant, by: relation, to: .firstBaseline(base: superview), priority: priority)
        case .topMargin: return self._makeY(for: attribute, constant: constant, by: relation, to: .topMargin(base: superview), priority: priority)
        case .bottomMargin: return self._makeY(for: attribute, constant: constant, by: relation, to: .bottomMargin(base: superview), priority: priority)
        case .centerYWithinMargins: return self._makeY(for: attribute, constant: constant, by: relation, to: .centerYWithinMargins(base: superview), priority: priority)
        default: fatalError("Driftwood ConstraintMaker Error: make attribute \(attribute) is not belong to Y-axis")
        }
    }
    
    /// make attribute Y
    private func _makeY(for attribute: NSLayoutAttribute, constant: CGFloat, by relation: Relation, to attributeY: AttributeY, priority: Priority) -> Self {
        guard nil == self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) already have \(attribute) constraint !!!")
        }
        
        let (attrY, view) = attributeY._rawTupleValue
        let con = NSLayoutConstraint(item: self._driftwood._base, attribute: attribute, relatedBy: relation, toItem: view, attribute: attrY, multiplier: 1, constant: constant)
        con.priority = priority
        con.isActive = true
        self._driftwood._constraintsWapper.constraints[attribute] = con
        return self
    }
    
    /// make attribute Size
    private func _makeSize(for attribute: NSLayoutAttribute, constant: CGFloat, by relation: Relation, to attributeSize: AttributeSize?, multiply: CGFloat, priority: Priority) -> Self {
        guard nil == self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintMaker Error: \(self._driftwood._base.description) already have \(attribute) constraint !!!")
        }
        
        let attrSize = attributeSize?._rawTupleValue
        let con = NSLayoutConstraint(item: self._driftwood._base, attribute: attribute, relatedBy: relation, toItem: attrSize?.1, attribute: attrSize?.0 ?? .notAnAttribute, multiplier: multiply, constant: constant)
        con.priority = priority
        con.isActive = true
        self._driftwood._constraintsWapper.constraints[attribute] = con
        return self
    }
}


/// Constraint Updater
public final class ConstraintUpdater: ConstraintOperator {
    
    //===========================================
    // Update AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .left, constant: constant, priority: priority)
    }
    
    /// right
    @discardableResult
    public func right(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .right, constant: constant, priority: priority)
    }
    
    /// leading
    @discardableResult
    public func leading(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .leading, constant: constant, priority: priority)
    }
    
    /// trailing
    @discardableResult
    public func trailing(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .trailing, constant: constant, priority: priority)
    }
    
    /// centerX
    @discardableResult
    public func centerX(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .centerX, constant: constant, priority: priority)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .leftMargin, constant: constant, priority: priority)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .rightMargin, constant: constant, priority: priority)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .leadingMargin, constant: constant, priority: priority)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .trailingMargin, constant: constant, priority: priority)
    }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .centerXWithinMargins, constant: constant, priority: priority)
    }
    
    //===========================================
    // Update AttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .top, constant: constant, priority: priority)
    }
    
    /// bottom
    @discardableResult
    public func bottom(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .bottom, constant: constant, priority: priority)
    }
    
    /// centerY
    @discardableResult
    public func centerY(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .centerY, constant: constant, priority: priority)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .lastBaseline, constant: constant, priority: priority)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .firstBaseline, constant: constant, priority: priority)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .topMargin, constant: constant, priority: priority)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .bottomMargin, constant: constant, priority: priority)
    }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .centerYWithinMargins, constant: constant, priority: priority)
    }
    
    //===========================================
    // Update AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .width, constant: constant, priority: priority)
    }
    
    /// height
    @discardableResult
    public func height(_ constant: CGFloat? = nil, priority: Priority? = nil) -> Self {
        return self._update(for: .height, constant: constant, priority: priority)
    }
    
    //===========================================
    // Private Update
    //===========================================
    //
    /// update attribute
    private func _update(for attribute: NSLayoutAttribute, constant: CGFloat?, priority: Priority?) -> Self {
        guard let con = self._driftwood._constraintsWapper.constraints[attribute] else {
            fatalError("Driftwood ConstraintUpdater Error: \(self._driftwood._base.description) have no \(attribute) constraint !!!")
        }
        
        if let _constant = constant { con.constant = _constant }
        if let _priority = priority { con.priority = _priority }
        return self
    }
}


/// Constraint Remover
public final class ConstraintRemover: ConstraintOperator {
    
    //===========================================
    // Remove AttributeX
    //===========================================
    //
    /// left
    @discardableResult
    public func left() -> Self {
        return self._remove(for: .left)
    }
    
    /// right
    @discardableResult
    public func right() -> Self {
        return self._remove(for: .right)
    }
    
    /// leading
    @discardableResult
    public func leading() -> Self {
        return self._remove(for: .leading)
    }
    
    /// trailing
    @discardableResult
    public func trailing() -> Self {
        return self._remove(for: .trailing)
    }
    
    /// centerX
    @discardableResult
    public func centerX() -> Self {
        return self._remove(for: .centerX)
    }
    
    /// leftMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leftMargin() -> Self {
        return self._remove(for: .leftMargin)
    }
    
    /// rightMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func rightMargin() -> Self {
        return self._remove(for: .rightMargin)
    }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func leadingMargin() -> Self {
        return self._remove(for: .leadingMargin)
    }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func trailingMargin() -> Self {
        return self._remove(for: .trailingMargin)
    }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerXWithinMargins() -> Self {
        return self._remove(for: .centerXWithinMargins)
    }
    
    //===========================================
    // Remove AttributeY
    //===========================================
    //
    /// top
    @discardableResult
    public func top() -> Self {
        return self._remove(for: .top)
    }
    
    /// bottom
    @discardableResult
    public func bottom() -> Self {
        return self._remove(for: .bottom)
    }
    
    /// centerY
    @discardableResult
    public func centerY() -> Self {
        return self._remove(for: .centerY)
    }
    
    /// lastBaseline
    @discardableResult
    public func lastBaseline() -> Self {
        return self._remove(for: .lastBaseline)
    }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    @discardableResult
    public func firstBaseline() -> Self {
        return self._remove(for: .firstBaseline)
    }
    
    /// topMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func topMargin() -> Self {
        return self._remove(for: .topMargin)
    }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    @discardableResult
    public func bottomMargin() -> Self {
        return self._remove(for: .bottomMargin)
    }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    @discardableResult
    public func centerYWithinMargins() -> Self {
        return self._remove(for: .centerYWithinMargins)
    }
    
    //===========================================
    // Remove AttributeSize
    //===========================================
    //
    /// width
    @discardableResult
    public func width() -> Self {
        return self._remove(for: .width)
    }
    
    /// height
    @discardableResult
    public func height() -> Self {
        return self._remove(for: .height)
    }
    
    //===========================================
    // Private Remove
    //===========================================
    //
    /// remove attribute
    private func _remove(for attribute: NSLayoutAttribute) -> Self {
        guard let con = self._driftwood._constraintsWapper.constraints.removeValue(forKey: attribute) else {
            fatalError("Driftwood ConstraintRemover Error: \(self._driftwood._base.description) have no \(attribute) constraint !!!")
        }
        
        con.isActive = false
        return self
    }
}


/// Driftwood
public final class Driftwood {
    
    //===========================================
    // Make, Update, Remove, Remake Constraint
    //===========================================
    //
    /// make
    public var make: ConstraintMaker {
        return ConstraintMaker(driftwood: self)
    }
    
    /// update
    public var update: ConstraintUpdater {
        return ConstraintUpdater(driftwood: self)
    }
    
    /// remove
    public var remove: ConstraintRemover {
        return ConstraintRemover(driftwood: self)
    }
    
    /// remake
    public var remake: ConstraintMaker {
        // remove all constraints from superview
        self._constraintsWapper.constraints.values.forEach({ $0.isActive = false })
        self._constraintsWapper.constraints = [:]
        return ConstraintMaker(driftwood: self)
    }
    
    
    //===========================================
    // AttributeX
    //===========================================
    //
    /// left
    public var left: AttributeX { return .left(base: _base) }
    
    /// right
    public var right: AttributeX { return .right(base: _base) }
    
    /// leading
    public var leading: AttributeX { return .leading(base: _base) }
    
    /// trailing
    public var trailing: AttributeX { return .trailing(base: _base) }
    
    /// centerX
    public var centerX: AttributeX { return .centerX(base: _base) }
    
    /// leftMargin
    @available(iOS 8.0, *)
    public var leftMargin: AttributeX { return .leftMargin(base: _base) }
    
    /// rightMargin
    @available(iOS 8.0, *)
    public var rightMargin: AttributeX { return .rightMargin(base: _base) }
    
    /// leadingMargin
    @available(iOS 8.0, *)
    public var leadingMargin: AttributeX { return .leadingMargin(base: _base) }
    
    /// trailingMargin
    @available(iOS 8.0, *)
    public var trailingMargin: AttributeX { return .trailingMargin(base: _base) }
    
    /// centerXWithinMargins
    @available(iOS 8.0, *)
    public var centerXWithinMargins: AttributeX { return .centerXWithinMargins(base: _base) }
    
    
    //===========================================
    // AttributeY
    //===========================================
    //
    /// top
    public var top: AttributeY { return .top(base: _base) }
    
    /// bottom
    public var bottom: AttributeY { return .bottom(base: _base) }
    
    /// centerY
    public var centerY: AttributeY { return .centerY(base: _base) }
    
    /// lastBaseline
    public var lastBaseline: AttributeY { return .lastBaseline(base: _base) }
    
    /// firstBaseline
    @available(iOS 8.0, *)
    public var firstBaseline: AttributeY { return .firstBaseline(base: _base) }
    
    /// topMargin
    @available(iOS 8.0, *)
    public var topMargin: AttributeY { return .topMargin(base: _base) }
    
    /// bottomMargin
    @available(iOS 8.0, *)
    public var bottomMargin: AttributeY { return .bottomMargin(base: _base) }
    
    /// centerYWithinMargins
    @available(iOS 8.0, *)
    public var centerYWithinMargins: AttributeY { return .centerYWithinMargins(base: _base) }
    
    
    //===========================================
    // AttributeSize
    //===========================================
    //
    /// width
    public var width: AttributeSize { return .width(base: _base) }
    
    /// height
    public var height: AttributeSize { return .height(base: _base) }
    
    
    // MARK: - Private
    /// _ConstraintsWrapper
    fileprivate class _ConstraintsWrapper {
        var constraints: [NSLayoutAttribute: NSLayoutConstraint] = [:]
    }
    
    /// init
    fileprivate init(base: DriftwoodBase) { _base = base }
    
    /// base view
    fileprivate let _base: DriftwoodBase
    
    // constraints wrapper
    fileprivate var _constraintsWapper: _ConstraintsWrapper {
        if let cw = objc_getAssociatedObject(self._base, &_constraintsWapperKey) as? _ConstraintsWrapper {
            return cw
        } else {
            let cw = _ConstraintsWrapper()
            objc_setAssociatedObject(self._base, &_constraintsWapperKey, cw, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return cw
        }
    }
}


/// UIView+Driftwood
extension UIView {
    
    /// driftwood
    public var dw: Driftwood { return Driftwood(base: self) }
}


/// UILayoutGuide+Driftwood
@available(iOS 9.0, *)
extension UILayoutGuide {
    
    /// driftwood
    public var dw: Driftwood { return Driftwood(base: self) }
}


/// _constraintsWapper Key
private var _constraintsWapperKey: Void?

