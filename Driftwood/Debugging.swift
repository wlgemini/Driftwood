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
enum Debug {
    
    /// log (execute only in debug mode)
    ///
    ///     "<Driftwood.@ViewController#23.[make left].(UIView`MyView`:0x00007fc636525111)>: "
    ///
    static func log(location: Location, operation: Operation, item: Item, message: String) {
        Swift.assert({
            var desc = "<"
            desc += Self.prefix(location: location, operation: operation)
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
    ///     "Driftwood.@ViewController#23.[make left]"
    ///     "Driftwood.[make left]"
    ///
    static func prefix(location: Location?, operation: Operation) -> String {
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
    
    /// description of Item
    ///
    ///     "UIView`MyView`:0x00007fc636525111"
    ///     "UIView:0x00007fc636525111"
    ///
    static func description(for item: Item) -> String {
        var desc = "\(Swift.type(of: item))"
        // using `Storage.anyStorage` to avoid unnecessary `Storage` object create.
        if let labeledName = Storage.anyStorage(for: item)?.labeledName {
            desc += "`\(labeledName)`"
        }
        desc += ":\(String(format: "%p", UInt(bitPattern: ObjectIdentifier(item))))"
        return desc
    }
    
    /// description of Attribute
    static func description(for attribute: Attribute) -> String {
        switch attribute {
        // HAttribute
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
            
        // VAttribute
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
            
        // SAttribute
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
        ///
        ///     "@ViewController#23"
        ///
        var description: String {
            let fileName = self.file.split(separator: "/").last?.split(separator: ".").first ?? ""
            return "@\(String(fileName))#\(self.line)"
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
            case .make(let attribute):          return "make \(Debug.description(for: attribute))"
            case .update(let attribute):        return "update \(Debug.description(for: attribute))"
            case .remove(let attribute):        return "remove \(Debug.description(for: attribute))"
            }
        }
    }
}
