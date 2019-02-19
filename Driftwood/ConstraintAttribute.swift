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


/// ConstraintAttributeX
public enum ConstraintAttributeX {
    
    case superview
    
    case left(ConstraintItem)
    
    case right(ConstraintItem)
    
    case leading(ConstraintItem)
    
    case trailing(ConstraintItem)
    
    case centerX(ConstraintItem)
    
    #if os(iOS) || os(tvOS)
    case leftMargin(ConstraintItem)
    
    case rightMargin(ConstraintItem)
    
    case leadingMargin(ConstraintItem)
    
    case trailingMargin(ConstraintItem)
    
    case centerXWithinMargins(ConstraintItem)
    #endif
}


/// ConstraintAttributeY
public enum ConstraintAttributeY {
    
    case superview
    
    case top(ConstraintItem)
    
    case bottom(ConstraintItem)
    
    case centerY(ConstraintItem)
    
    case lastBaseline(ConstraintItem)
    
    case firstBaseline(ConstraintItem)
    
    #if os(iOS) || os(tvOS)
    case topMargin(ConstraintItem)
    
    case bottomMargin(ConstraintItem)
    
    case centerYWithinMargins(ConstraintItem)
    #endif
}


/// ConstraintAttributeSize
public enum ConstraintAttributeSize {
    
    case width(ConstraintItem)
    
    case height(ConstraintItem)
}
