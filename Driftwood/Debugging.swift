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


/// Debug
struct Debug {
    
    /// log (execute only in debug mode)
    ///
    ///     "<Driftwood.@ViewController.swift#23.[make.left].(UIView`MyView`:0x00007fc636525111)>: "
    ///
    static func log(_ location: Location, _ operation: Operation, _ item: Item, message: String) {
        Swift.assert({
            var desc = "<"
            desc += Self.prefix(location, operation)
            desc += ".(\(Self.description(for: item)))"
            desc += ">"
            desc += ": "
            desc += message
            print(desc)
            return true
        }())
    }
    
    /// debug prefix
    ///
    ///     "Driftwood.@ViewController.swift#23.[make.left]"
    ///     "Driftwood.[make.left]"
    ///
    static func prefix(_ location: Location?, _ operation: Operation) -> String {
        // Driftwood
        var pre = "Driftwood"
        
        // loction
        if let loc = location {
            pre += ".\(loc)"
        }
        
        // operation
        pre += ".[\(operation)]"
        
        return pre
    }
    
    /// description of AnyObject
    ///
    ///     "UIView`MyView`:0x00007fc636525111"
    ///     "UIView:0x00007fc636525111"
    ///
    static func description(for obj: AnyObject) -> String {
        var desc = "\(Swift.type(of: obj))"
        if let item = obj as? Item {
            // using `_storage` instead of `storage`, which avoid unnecessary `Storage` object makes.
            if let labeledName = item._storage?.labeledName {
                desc += "`\(labeledName)`"
            }
        }
        desc += ":\(String(describing: Unmanaged.passUnretained(obj).toOpaque()))"
        return desc
    }
    
    /// description of Attribute
    static func description(for attribute: Attribute) -> String {
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
            
        // default
        @unknown default:           fatalError("New case need handled.")
        }
    }
    
    /// description of Relation
    static func description(for relation: Relation) -> String {
        switch relation {
        case .equal:                return "=="
        case .greaterThanOrEqual:   return ">="
        case .lessThanOrEqual:      return "<="
        @unknown default:           fatalError("New case need handled.")
        }
    }
}


extension Debug {
    
    /// Location
    struct Location: CustomStringConvertible {
        
        /// file
        let file: String
        
        /// line
        let line: UInt
        
        /// init
        init(_ file: String, _ line: UInt) {
            self.file = file
            self.line = line
        }
        
        /// description
        var description: String {
            let fileName = self.file.components(separatedBy: "/").last ?? ""
            return "@\(fileName)#\(self.line)"
        }
    }
    
    
    /// Operation
    enum Operation: CustomStringConvertible {
        
        case make(Attribute)
        
        case update(Attribute)
        
        case remove(Attribute)
        
        /// description
        var description: String {
            switch self {
            case .make(let attribute):          return "make.\(Debug.description(for: attribute))"
            case .update(let attribute):        return "update.\(Debug.description(for: attribute))"
            case .remove(let attribute):        return "remove.\(Debug.description(for: attribute))"
            }
        }
    }
}
