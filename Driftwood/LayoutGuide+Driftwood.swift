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


#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


#if os(iOS) || os(tvOS)
/// LayoutGuide
@available(iOS 9.0, *)
public typealias LayoutGuide = UILayoutGuide
#else
/// LayoutGuide
@available(OSX 10.11, *)
public typealias LayoutGuide = NSLayoutGuide
#endif


/// LayoutGuide+Item
@available(iOS 9.0, OSX 10.11, *)
extension LayoutGuide: ConstraintItem {
    
    public var dw_superview: ConstraintItem? {
        return self.owningView
    }
    
    public var dw_hashValue: Int {
        return self.hashValue
    }
}


/// LayoutGuide+Driftwood
@available(iOS 9.0, OSX 10.11, *)
extension LayoutGuide {
    
    /// driftwood
    public var dw: Driftwood {
        return Driftwood(self)
    }
}