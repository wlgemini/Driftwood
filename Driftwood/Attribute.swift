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


/// AttributeX
public enum AttributeX {
    
    case superview
    
    case left(Item)
    
    case right(Item)
    
    case leading(Item)
    
    case trailing(Item)
    
    case centerX(Item)
    
    #if os(iOS) || os(tvOS)
    case leftMargin(Item)
    
    case rightMargin(Item)
    
    case leadingMargin(Item)
    
    case trailingMargin(Item)
    
    case centerXWithinMargins(Item)
    #endif
}


/// AttributeY
public enum AttributeY {
    
    case superview
    
    case top(Item)
    
    case bottom(Item)
    
    case centerY(Item)
    
    case lastBaseline(Item)
    
    case firstBaseline(Item)
    
    #if os(iOS) || os(tvOS)
    case topMargin(Item)
    
    case bottomMargin(Item)
    
    case centerYWithinMargins(Item)
    #endif
}


/// AttributeSize
public enum AttributeSize {
    
    case width(Item)
    
    case height(Item)
}
