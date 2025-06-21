#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif
import Testing
@testable import Driftwood


@MainActor
@Suite
struct DriftwoodTests {
    
    let container = View(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 400)))
    
    func createSubview() -> View {
        let v1 = View(frame: .zero)
        self.container.addSubview(v1)
        return v1
    }
    
    func createSubview2() -> (View, View) {
        let v1 = View(frame: .zero)
        let v2 = View(frame: .zero)
        self.container.addSubview(v1)
        self.container.addSubview(v2)
        
        return (v1, v2)
    }
}


extension DriftwoodTests {
    
    @Test
    func prioritySafety() {
        #expect(Priority.minOptional.rawValue == 1)
        #expect(Priority.maxOptional.rawValue == Priority.required.rawValue - 1)
        
        // isValidPriority
        #expect(Priority.isValidPriority(Priority(0)) == false)
        #expect(Priority.isValidPriority(Priority(1)) == true)
        #expect(Priority.isValidPriority(Priority(999)) == true)
        #expect(Priority.isValidPriority(Priority(1000)) == true)
        #expect(Priority.isValidPriority(Priority(1001)) == false)
        #expect(Priority.isValidPriority(Priority(-1)) == false)
        
        // isSafeToChangePriority
        #expect(Priority.isSafeToChangePriority(from: .minOptional, to: .maxOptional) == true)
        #expect(Priority.isSafeToChangePriority(from: .maxOptional, to: .required) == false)
        #expect(Priority.isSafeToChangePriority(from: .required, to: .maxOptional) == false)
        #expect(Priority.isSafeToChangePriority(from: .required, to: .required) == true)
    }
    
    @Test
    func contentHugging() {
        let v1 = self.createSubview()
        
        v1.dw.setContentHuggingVerticalPriority(.minOptional)
        v1.dw.setContentHuggingHorizontalPriority(.minOptional)
        
        #expect(v1.dw.contentHuggingVerticalPriority == .minOptional)
        #expect(v1.dw.contentHuggingHorizontalPriority == .minOptional)
        
        
        v1.dw.setContentHuggingVerticalPriority(.required)
        v1.dw.setContentHuggingHorizontalPriority(.required)
        
        #expect(v1.dw.contentHuggingVerticalPriority == .required)
        #expect(v1.dw.contentHuggingHorizontalPriority == .required)
    }
    
    @Test
    func contentCompressionResistance() {
        let v1 = self.createSubview()
        
        v1.dw.setContentCompressionResistanceVerticalPriority(.minOptional)
        v1.dw.setContentCompressionResistanceHorizontalPriority(.minOptional)
        
        #expect(v1.dw.contentCompressionResistanceVerticalPriority == .minOptional)
        #expect(v1.dw.contentCompressionResistanceHorizontalPriority == .minOptional)
        
        
        v1.dw.setContentCompressionResistanceVerticalPriority(.required)
        v1.dw.setContentCompressionResistanceHorizontalPriority(.required)
        
        #expect(v1.dw.contentCompressionResistanceVerticalPriority == .required)
        #expect(v1.dw.contentCompressionResistanceHorizontalPriority == .required)
    }
    
    @Test
    func storage() {
        let (v1, v2) = self.createSubview2()
        
        let s1 = Storage.anyStorage(for: v1)
        let s2 = Storage.storage(for: v2)
        
        #expect(s1 == nil)
        #expect(s2.activeConstraintsCount == 0)
        #expect(s2.cachedConstraints == 0)
        #expect(s2 === Storage.storage(for: v2))
    }
    
    @Test
    func labeledName() {
        let v1 = self.createSubview()
        let s1 = Storage.storage(for: v1)
       
        
        // label update
        #expect(s1.labeledName == nil)
        
        let label1 = "MyView1"
        let _ = v1.dw.make(labeled: "MyView1")
        #expect(s1.labeledName == label1)
        
        let label2 = "MyView2"
        let _ = v1.dw.update(labeled: label2)
        #expect(s1.labeledName == label2)
        
        let label3 = "MyView3"
        let _ = v1.dw.remake(labeled: label3)
        #expect(s1.labeledName == label3)
        
        let label4 = "MyView4"
        let _ = v1.dw.remove(labeled: label4)
        #expect(s1.labeledName == label4)
    }
    
    @Test
    func make() {
        let (v1, v2) = self.createSubview2()
        let s1 = Storage.storage(for: v1)
        let s2 = Storage.storage(for: v2)
        
        // v1
        v1.dw.make()
            .left(1)
            .right(2)
            .width(3)
            .height(4)
        
        #expect(s1.activeConstraintsCount == 4)
        #expect(s1.cachedConstraints == 4)
        
        let c_mk_v1_left = s1.activeConstraint(for: .left)
        let c_mk_v1_right = s1.activeConstraint(for: .right)
        let c_mk_v1_width = s1.activeConstraint(for: .width)
        let c_mk_v1_height = s1.activeConstraint(for: .height)
        
        #expect(
            c_mk_v1_left!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_mk_v1_right!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_right not equal"
        )
        
        #expect(
            c_mk_v1_width!.isEq(constant: 3, relation: Preferences.relation, secondItem: nil, secondAttribute: .notAnAttribute, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_width not equal"
        )
        
        #expect(
            c_mk_v1_height!.isEq(constant: 4, relation: Preferences.relation, secondItem: nil, secondAttribute: .notAnAttribute, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_height not equal"
        )
        
        
        // v2
        v2.dw.make()
            .centerX(5)
            .centerY(6)
            .width(7, to: v1.dw.width)
            .height(8, to: v1.dw.height)
        
        #expect(s2.activeConstraintsCount == 4)
        #expect(s2.cachedConstraints == 4)
        
        let c_mk_v2_centerX = s2.activeConstraint(for: .centerX)
        let c_mk_v2_centerY = s2.activeConstraint(for: .centerY)
        let c_mk_v2_width = s2.activeConstraint(for: .width)
        let c_mk_v2_height = s2.activeConstraint(for: .height)
        
        #expect(
            c_mk_v2_centerX!.isEq(constant: 5, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerX, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v2_centerX not equal"
        )
        
        #expect(
            c_mk_v2_centerY!.isEq(constant: 6, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerY, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v2_centerY not equal"
        )
        
        #expect(
            c_mk_v2_width!.isEq(constant: 7, relation: Preferences.relation, secondItem: v1, secondAttribute: .width, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v2_width not equal"
        )
        
        #expect(
            c_mk_v2_height!.isEq(constant: 8, relation: Preferences.relation, secondItem: v1, secondAttribute: .height, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v2_height not equal"
        )
    }
    
    @Test
    func update() {
        let v1 = self.createSubview()
        let s1 = Storage.storage(for: v1)
        
        // make
        v1.dw.make()
            .left(1, priority: Priority.required)
            .right(2, priority: Priority.maxOptional)
      
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        let c_mk_v1_left = s1.activeConstraint(for: .left)
        let c_mk_v1_right = s1.activeConstraint(for: .right)
    
        #expect(
            c_mk_v1_left!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: Priority.required),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_mk_v1_right!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: Priority.maxOptional),
            "c_mk_v1_right not equal"
        )
        
        
        // update
        v1.dw.update()
            .left(3, priority: Priority.maxOptional)
            .right(4, priority: Priority.minOptional)
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        let c_ud_v1_left = s1.activeConstraint(for: .left)
        let c_ud_v1_right = s1.activeConstraint(for: .right)
        
        #expect(c_mk_v1_left === c_ud_v1_left)
        #expect(c_mk_v1_right === c_ud_v1_right)
        
        #expect(
            c_ud_v1_left!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: Priority.required),
            "c_ud_v1_left not equal: Changing priority from/to `required` is not supported."
        )
        
        #expect(
            c_ud_v1_right!.isEq(constant: 4, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: Priority.minOptional),
            "c_ud_v1_right not equal"
        )
    }
    
    @Test
    func remake() {
        let v1 = self.createSubview()
        let s1 = Storage.storage(for: v1)
        
        // make
        v1.dw.make()
            .left(1)
            .right(2)
      
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        let c_mk_v1_left = s1.activeConstraint(for: .left)
        let c_mk_v1_right = s1.activeConstraint(for: .right)
        
        #expect(
            c_mk_v1_left!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_mk_v1_right!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_right not equal"
        )
        
        
        // remake
        v1.dw.remake()
            .left(3)
            .top(4)
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 3)
        
        let c_rmk_v1_left = s1.activeConstraint(for: .left)
        let c_rmk_v1_right = s1.activeConstraint(for: .top)
        
        #expect(
            c_mk_v1_left === c_rmk_v1_left,
            "c_mk_v1_left and c_rmk_v1_left should be the same, because Storage1 will reuse constraints from cache"
        )
        
        #expect(
            c_rmk_v1_left!.isEq(constant: 3, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_rmk_v1_right!.isEq(constant: 4, relation: Preferences.relation, secondItem: self.container, secondAttribute: .top, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_right not equal"
        )
    }
    
    @Test
    func remove() {
        let v1 = self.createSubview()
        let s1 = Storage.storage(for: v1)
        
        // make
        v1.dw.make()
            .left(1)
            .right(2)
            .width(3)
            .height(4)
        
        #expect(s1.activeConstraintsCount == 4)
        #expect(s1.cachedConstraints == 4)
        
        let c_mk_v1_left = s1.activeConstraint(for: .left)
        let c_mk_v1_right = s1.activeConstraint(for: .right)
        let c_mk_v1_width = s1.activeConstraint(for: .width)
        let c_mk_v1_height = s1.activeConstraint(for: .height)
        
        #expect(
            c_mk_v1_left!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_mk_v1_right!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_right not equal"
        )
        
        #expect(
            c_mk_v1_width!.isEq(constant: 3, relation: Preferences.relation, secondItem: nil, secondAttribute: .notAnAttribute, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_width not equal"
        )
        
        #expect(
            c_mk_v1_height!.isEq(constant: 4, relation: Preferences.relation, secondItem: nil, secondAttribute: .notAnAttribute, multiply: Preferences.multiply, priority: Preferences.priority),
            "c_mk_v1_height not equal"
        )
        
        // remove
        v1.dw.remove()
            .left()
            .width()
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 4)
        
        let c_rm_v1_left = s1.activeConstraint(for: .left)
        let c_rm_v1_right = s1.activeConstraint(for: .right)
        let c_rm_v1_width = s1.activeConstraint(for: .width)
        let c_rm_v1_height = s1.activeConstraint(for: .height)
        
        #expect(c_rm_v1_left == nil)
        #expect(c_rm_v1_right != nil)
        #expect(c_rm_v1_width == nil)
        #expect(c_rm_v1_height != nil)
        
        
        // removeAll
        v1.dw.removeAll()
        
        #expect(
            s1.activeConstraintsCount == 0,
            "Storage1 activeConstraintsCount = 2"
        )
        
        #expect(
            s1.cachedConstraints == 4,
            "Storage1 cachedConstraints = 4"
        )
    }
    
    @Test
    func handyEdges() {
        let v1 = self.createSubview()
        let s1 = Storage.storage(for: v1)
        
        // make
        v1.dw.make()
            .edge(insets: EdgeInsets(top: 1, left: 2, bottom: 3, right: 4), priority: .maxOptional)
        
        #expect(s1.activeConstraintsCount == 4)
        #expect(s1.cachedConstraints == 4)
        
        let c_mk_v1_left = s1.activeConstraint(for: .left)
        let c_mk_v1_right = s1.activeConstraint(for: .right)
        let c_mk_v1_top = s1.activeConstraint(for: .top)
        let c_mk_v1_bottom = s1.activeConstraint(for: .bottom)
        
        #expect(
            c_mk_v1_left!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_mk_v1_right!.isEq(constant: -4, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_left not equal"
        )
        
        #expect(
            c_mk_v1_top!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .top, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_top not equal"
        )
        
        #expect(
            c_mk_v1_bottom!.isEq(constant: -3, relation: Preferences.relation, secondItem: self.container, secondAttribute: .bottom, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_bottom not equal"
        )
        
        // update
        v1.dw.update()
            .edge(insets: EdgeInsets(top: 5, left: 6, bottom: 7, right: 8), priority: .minOptional)
        
        #expect(s1.activeConstraintsCount == 4)
        #expect(s1.cachedConstraints == 4)
        
        let c_ud_v1_left = s1.activeConstraint(for: .left)
        let c_ud_v1_right = s1.activeConstraint(for: .right)
        let c_ud_v1_top = s1.activeConstraint(for: .top)
        let c_ud_v1_bottom = s1.activeConstraint(for: .bottom)
        
        #expect(
            c_ud_v1_left!.isEq(constant: 6, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: .minOptional),
            "c_ud_v1_left not equal"
        )
        
        #expect(
            c_ud_v1_right!.isEq(constant: -8, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: .minOptional),
            "c_ud_v1_left not equal"
        )
        
        #expect(
            c_ud_v1_top!.isEq(constant: 5, relation: Preferences.relation, secondItem: self.container, secondAttribute: .top, multiply: Preferences.multiply, priority: .minOptional),
            "c_ud_v1_top not equal"
        )
        
        #expect(
            c_ud_v1_bottom!.isEq(constant: -7, relation: Preferences.relation, secondItem: self.container, secondAttribute: .bottom, multiply: Preferences.multiply, priority: .minOptional),
            "c_ud_v1_bottom not equal"
        )
        
        
        // remake
        v1.dw.remake()
            .edge(insets: EdgeInsets(top: 1, left: 2, bottom: 3, right: 4), priority: .maxOptional)
        
        #expect(s1.activeConstraintsCount == 4)
        #expect(s1.cachedConstraints == 4)
        
        let c_rmk_v1_left = s1.activeConstraint(for: .left)
        let c_rmk_v1_right = s1.activeConstraint(for: .right)
        let c_rmk_v1_top = s1.activeConstraint(for: .top)
        let c_rmk_v1_bottom = s1.activeConstraint(for: .bottom)
        
        #expect(c_rmk_v1_left === c_mk_v1_left)
        #expect(c_rmk_v1_right === c_mk_v1_right)
        #expect(c_rmk_v1_top === c_mk_v1_top)
        #expect(c_rmk_v1_bottom === c_mk_v1_bottom)
        
        #expect(
            c_rmk_v1_left!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .left, multiply: Preferences.multiply, priority: .maxOptional),
            "c_rmk_v1_left not equal"
        )
        
        #expect(
            c_rmk_v1_right!.isEq(constant: -4, relation: Preferences.relation, secondItem: self.container, secondAttribute: .right, multiply: Preferences.multiply, priority: .maxOptional),
            "c_rmk_v1_right not equal"
        )
        
        #expect(
            c_rmk_v1_top!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .top, multiply: Preferences.multiply, priority: .maxOptional),
            "c_rmk_v1_top not equal"
        )
        
        #expect(
            c_rmk_v1_bottom!.isEq(constant: -3, relation: Preferences.relation, secondItem: self.container, secondAttribute: .bottom, multiply: Preferences.multiply, priority: .maxOptional),
            "c_rmk_v1_bottom not equal"
        )
        
        
        // remove
        v1.dw.remove().edge()
        
        #expect(s1.activeConstraintsCount == 0)
        #expect(s1.cachedConstraints == 4)
    }
    
    @Test
    func handyCenterXY() {
        let v1 = self.createSubview()
        let s1 = Storage.storage(for: v1)
        
        // make
        v1.dw.make()
            .centerXY(offsets: CGPoint(x: 1, y: 2), priority: .maxOptional)
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        let c_mk_v1_centerX = s1.activeConstraint(for: .centerX)
        let c_mk_v1_centerY = s1.activeConstraint(for: .centerY)
        
        #expect(
            c_mk_v1_centerX!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerX, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_centerX not equal"
        )
        
        #expect(
            c_mk_v1_centerY!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerY, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_centerY not equal"
        )

        
        // update
        v1.dw.update()
            .centerXY(offsets: CGPoint(x: 3, y: 4), priority: .minOptional)
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        let c_ud_v1_centerX = s1.activeConstraint(for: .centerX)
        let c_ud_v1_centerY = s1.activeConstraint(for: .centerY)
        
        #expect(
            c_ud_v1_centerX!.isEq(constant: 3, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerX, multiply: Preferences.multiply, priority: .minOptional),
            "c_ud_v1_centerX not equal"
        )
        
        #expect(
            c_ud_v1_centerY!.isEq(constant: 4, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerY, multiply: Preferences.multiply, priority: .minOptional),
            "c_ud_v1_centerY not equal"
        )
        
        
        // remake
        v1.dw.remake()
            .centerXY(offsets: CGPoint(x: 1, y: 2), priority: .maxOptional)
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        let c_rmk_v1_centerX = s1.activeConstraint(for: .centerX)
        let c_rmk_v1_centerY = s1.activeConstraint(for: .centerY)
        
        #expect(c_rmk_v1_centerX === c_mk_v1_centerX)
        #expect(c_rmk_v1_centerY === c_mk_v1_centerY)
        
        #expect(
            c_rmk_v1_centerX!.isEq(constant: 1, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerX, multiply: Preferences.multiply, priority: .maxOptional),
            "c_rmk_v1_centerX not equal"
        )
        
        #expect(
            c_rmk_v1_centerY!.isEq(constant: 2, relation: Preferences.relation, secondItem: self.container, secondAttribute: .centerY, multiply: Preferences.multiply, priority: .maxOptional),
            "c_rmk_v1_centerY not equal"
        )
        
        
        // remove
        v1.dw.remove().centerXY()
        
        #expect(s1.activeConstraintsCount == 0)
        #expect(s1.cachedConstraints == 2)
    }
    
    @Test
    func handySize() {
        let (v1, v2) = self.createSubview2()
        let s1 = Storage.storage(for: v1)
        let s2 = Storage.storage(for: v2)
        
        // make
        v1.dw.make()
            .width(1, priority: .maxOptional)
            .height(2, priority: .maxOptional)
        
        v2.dw.make()
            .size(to: v1, priority: .maxOptional)
        
        #expect(s1.activeConstraintsCount == 2)
        #expect(s1.cachedConstraints == 2)
        
        #expect(s2.activeConstraintsCount == 2)
        #expect(s2.cachedConstraints == 2)
        
        let c_mk_v1_width = s1.activeConstraint(for: .width)
        let c_mk_v1_height = s1.activeConstraint(for: .height)
        let c_mk_v2_width = s2.activeConstraint(for: .width)
        let c_mk_v2_height = s2.activeConstraint(for: .height)
        
        #expect(
            c_mk_v1_width!.isEq(constant: 1, relation: Preferences.relation, secondItem: nil, secondAttribute: .notAnAttribute, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_width not equal"
        )
        
        #expect(
            c_mk_v1_height!.isEq(constant: 2, relation: Preferences.relation, secondItem: nil, secondAttribute: .notAnAttribute, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v1_height not equal"
        )
        
        #expect(
            c_mk_v2_width!.isEq(constant: 0, relation: Preferences.relation, secondItem: v1, secondAttribute: .width, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v2_width not equal"
        )
        
        #expect(
            c_mk_v2_height!.isEq(constant: 0, relation: Preferences.relation, secondItem: v1, secondAttribute: .height, multiply: Preferences.multiply, priority: .maxOptional),
            "c_mk_v2_height not equal"
        )


        // remake
        v2.dw.remake()
            .size(to: v1, priority: .minOptional)
    
        #expect(s2.activeConstraintsCount == 2)
        #expect(s2.cachedConstraints == 2)
        
        let c_rmk_v2_width = s2.activeConstraint(for: .width)
        let c_rmk_v2_height = s2.activeConstraint(for: .height)
        
        #expect(c_rmk_v2_width === c_mk_v2_width)
        #expect(c_rmk_v2_height === c_mk_v2_height)
        
        #expect(
            c_rmk_v2_width!.isEq(constant: 0, relation: Preferences.relation, secondItem: v1, secondAttribute: .width, multiply: Preferences.multiply, priority: .minOptional),
            "c_rmk_v2_width not equal"
        )
        
        #expect(
            c_rmk_v2_height!.isEq(constant: 0, relation: Preferences.relation, secondItem: v1, secondAttribute: .height, multiply: Preferences.multiply, priority: .minOptional),
            "c_rmk_v2_height not equal"
        )
        
        // remove
        v1.dw.remove().size()
        
        #expect(s1.activeConstraintsCount == 0)
        #expect(s1.cachedConstraints == 2)
    }
}
