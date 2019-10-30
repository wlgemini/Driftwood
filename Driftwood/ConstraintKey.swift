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


/// ConstraintKey
struct ConstraintKey: Hashable {
    
    /// attribute
    let attribute: Attribute
    
    /// Using `ObjectIdentifier` to avoid ARC: [Difference between using ObjectIdentifier() and '===' Operator](https://stackoverflow.com/questions/39587027/difference-between-using-objectidentifier-and-operator)
    let toItem: ObjectIdentifier?
    
    /// toAttribute
    let toAttribute: Attribute
    
    /// relation
    let relation: Relation
    
    /// multiply
    let multiply: CGFloat
    
    /// init
    init(attribute: Attribute, toItem: Item?, toAttribute: Attribute, relation: Relation, multiply: CGFloat) {
        self.attribute = attribute
        if let toItem = toItem {
            self.toItem = ObjectIdentifier(toItem)
        } else {
            self.toItem = nil
        }
        self.toAttribute = toAttribute
        self.relation = relation
        self.multiply = multiply
    }
}
