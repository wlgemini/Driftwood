#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif
import Testing
@testable import Driftwood



extension Driftwood.Storage {
    
    func hasActiveAttributes(_ attrs: [Attribute]) -> Bool {
        for attr in attrs {
            if let _ = self.activeConstraint(for: attr) {
                continue
            } else {
                return false
            }
        }
        
        return true
    }
}


extension Driftwood.Constraint {
    
    func isEq(
        constant: CGFloat,
        relation: Relation,
        secondItem: AnyObject?,
        secondAttribute: Attribute,
        multiply: CGFloat,
        priority: Priority) -> Bool {
        (self.constant == constant) &&
        (self.relation == relation) &&
        (self.secondItem === secondItem) &&
        (self.secondAttribute == secondAttribute) &&
        (self.multiplier == multiply) &&
        (self.priority == priority)
    }
}
