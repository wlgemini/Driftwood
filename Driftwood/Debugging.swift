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







// desc
//        "<Driftwood.@SignUpViewController.swift#311.<UIView('MyView'):0x123124234>.[make.left:0x123124234]>"
//        "<Driftwood.@SignUpViewController.swift#311.<UIView:0x123124234>.[make.left:0x123124234]>"
//        "<Driftwood.<UIView:0x123124234>.[make.left:0x123124234]>"

// err
// <Driftwood.@SignUpViewController.swift#311.<UIView('MyView'):0x00007fc636525da0>.[make.left]> error: duplicate constraint


// "Driftwood internal error: found 'active' while activate constraint '\(_type(of:key))'."
// <Driftwood.@SignUpViewController.swift#311> error: found 'active' while activate constraint '\(_type(of:key))'."





//func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = default, file: StaticString = #file, line: UInt = #line)


/// Code Location
struct Location {
    let file: String
    let line: UInt
    
    init(_ file: String, _ line: UInt) {
        self.file = file
        self.line = line
    }
}


/// constraint operation
struct Operation {
    
    enum `Kind` {
        case make, update, remove, _activate, _update, _deactivate, _dequque
    }
    
    var kind: Kind
    
    var attribute: Attribute
    
    init(_ kind: Kind, _ attribute: Attribute) {
        self.kind = kind
        self.attribute = attribute
    }
}

/// Debug
struct Debug {
    
    /// prefix
    static func prefix(_ location: Location?, _ item: ConstraintItem?, _ operation: Operation?, _ constraint: LayoutConstraint?) -> String {
        // <
        var desc = "<"
        
        // module
        desc += "Driftwood"
        
        // loction
        if let loc = location {
            desc += ".@\((loc.file as NSString).lastPathComponent)#\(loc.line)"
        }
        
        // item
        if let it = item {
            desc += ".<\(Swift.type(of: it))"
            if let lb = it.storage.labeled {
                desc += "('\(lb)')"
            }
            desc += ":\(Debug.pointer(of: it))>"
        }
        
        // operation
        if let ope = operation {
            desc += ".[\(ope.kind).\(Debug.type(of: ope.attribute))"
            if let con = constraint {
                desc += ":\(Debug.pointer(of: con))"
            }
            desc += "]"
        }
        
        // >
        desc += ">"
        
        return desc
    }
    
    /// log
    static func log(_ location: Location?, _ item: ConstraintItem?, _ operation: Operation?, message: String) {
        Swift.assert({
            var desc = self.prefix(location, item, operation, nil)
            desc += " error: "
            desc += message
            print(desc)
            return true
        }())
    }
    
    /// assert
    static func assert(_ location: Location?, _ item: ConstraintItem?, _ operation: Operation?, condition: @autoclosure () -> Bool, message: String) {
        Swift.assert(condition(), {
            var desc = self.prefix(location, item, operation, nil)
            desc += " error: "
            desc += message
            return desc
        }())
    }
    
    /// typy of attribute
    static func type(of attribute: Attribute) -> String {
        switch attribute {
        // AttributeX
        case .left:                 return "left"
        case .right:                return "right"
        case .leading:              return "leading"
        case .trailing:             return "trailing"
        case .centerX:              return "centerX"
            #if os(iOS) || os(tvOS)
        case .leftMargin:           return "leftMargin"
        case .rightMargin:          return "rightMargin"
        case .leadingMargin:        return "leadingMargin"
        case .trailingMargin:       return "trailingMargin"
        case .centerXWithinMargins: return "centerXWithinMargins"
            #endif
            
        // AttributeY
        case .top:                  return "top"
        case .bottom:               return "bottom"
        case .centerY:              return "centerY"
        case .lastBaseline:         return "lastBaseline"
        case .firstBaseline:        return "firstBaseline"
            #if os(iOS) || os(tvOS)
        case .topMargin:            return "topMargin"
        case .bottomMargin:         return "bottomMargin"
        case .centerYWithinMargins: return "centerYWithinMargins"
            #endif
            
        // AttributeSize
        case .width:                return "width"
        case .height:               return "height"
            
        // notAnAttribute
        case .notAnAttribute:       return "notAnAttribute"
        }
    }
    
    /// return an address of an object
    static func pointer(of anyObject: AnyObject) -> String {
        return String(describing: Unmanaged.passUnretained(anyObject).toOpaque())
    }
}
