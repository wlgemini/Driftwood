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


/// ConstraintItem
public protocol ConstraintItem: AnyObject {
    
    /// superview
    var dw_superview: ConstraintItem? { get }
    
    /// hashValue
    var dw_hashValue: Int { get }
}


/// ConstraintItem (ConstraintsStorage)
extension ConstraintItem {
    
    /// storage
    var storage: ConstraintsStorage {
        if let s = self._storage {
            return s
        } else {
            let s = ConstraintsStorage()
            self._storage = s
            return s
        }
    }
    
    /// _storage
    var _storage: ConstraintsStorage? {
        get { return objc_getAssociatedObject(self, &_storageKey) as? ConstraintsStorage }
        set { objc_setAssociatedObject(self, &_storageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}


/// _storage Key
fileprivate var _storageKey: Void?
