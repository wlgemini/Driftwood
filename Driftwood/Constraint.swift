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


/// Constraint
final class Constraint: LayoutConstraint {
    
    /// location (never nil when used)
    var location: Debug.Location!
    
    /// operation (never nil when used)
    var operation: Debug.Operation!
    
    /// description
    ///
    ///     "<Driftwood.@ViewController.swift#23.[make.left].(UIView`MyView`:0x00007fc636525da0.left == UILabel`MyLabel`:0x00007fc636525111.right * 2 - 10 ^1500)>"
    ///
    override var description: String {
        // <
        var desc = "<"
        
        // prefix
        desc += Debug.prefix(self.location, self.operation)
        
        // constraint
        desc += ".("
        
        if let fi = self.firstItem {
            desc += Debug.description(for: fi)
        }
        
        if self.firstAttribute != .notAnAttribute  {
            desc += ".\(Debug.description(for: self.firstAttribute))"
        }
        
        desc += " \(Debug.description(for: self.relation))"
        
        if let si = self.secondItem {
            desc += " \(Debug.description(for: si))"
        }
        
        if self.secondAttribute != .notAnAttribute {
            desc += ".\(Debug.description(for: self.secondAttribute))"
        }
        
        if self.multiplier != 1.0 {
            desc += " * \(self.multiplier)"
        }
        
        if self.secondAttribute == .notAnAttribute {
            desc += " \(self.constant)"
        } else {
            if self.constant > 0.0 {
                desc += " + \(self.constant)"
            } else if self.constant < 0.0 {
                desc += " - \(abs(self.constant))"
            }
        }
        
        if self.priority.rawValue != 1000.0 {
            desc += " ^\(self.priority.rawValue)"
        }
        
        desc += ")"
        
        // >
        desc += ">"
        
        return desc
    }
}
