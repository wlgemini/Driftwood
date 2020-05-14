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


/// Item
public protocol Item: AnyObject {
    
    /// superview
    var dw_superview: Item? { get }
}


/// Item (ConstraintDSL)
public extension Item {
    
    /// dw
    var dw: ConstraintDSL<Self> { ConstraintDSL(item: self) }
}


/// Item (Storage)
extension Item {
    
    /// storage
    var storage: Storage {
        if let s = self._storage {
            return s
        } else {
            let s = Storage()
            self._storage = s
            return s
        }
    }
    
    /// _storage
    var _storage: Storage? {
        get { objc_getAssociatedObject(self, &_storageKey) as? Storage }
        set { objc_setAssociatedObject(self, &_storageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}


/// _storage Key
private var _storageKey: Void?
