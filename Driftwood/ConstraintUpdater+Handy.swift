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


/// ConstraintUpdater (Handy)
public extension ConstraintUpdater {
    
    //===========================================
    // Update AttributeX & AttributeY
    //===========================================
    //
    /// centerXY
    @inlinable
    @discardableResult
    func centerXY(offsets: CGPoint? = nil, priority: Priority? = nil) -> Self {
        self.centerX(offsets?.x, priority: priority)
        self.centerY(offsets?.y, priority: priority)
        return self
    }
    
    /// edge
    @inlinable
    @discardableResult
    func edge(insets: EdgeInsets? = nil, priority: Priority? = nil) -> Self {
        self.leading(insets?.left, priority: priority)
        self.trailing(insets != nil ? -insets!.right : nil, priority: priority)
        self.top(insets?.top, priority: priority)
        self.bottom(insets != nil ? -insets!.bottom : nil, priority: priority)
        return self
    }
}
