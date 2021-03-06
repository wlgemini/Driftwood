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


/// Wood (Priority)
extension Wood where Subject == Priority {
    
    /// Get a lower priority (aka: `current - 1`), min to `1`
    @inlinable
    public var lower: Priority { self.lower(1) }
    
    /// Get a higher priority (aka: `current + 1`), max to `required - 1`
    @inlinable
    public var higher: Priority { self.higher(1) }
    
    /// Get a lower priority (aka: `current - value`), min to `1`
    public func lower(_ value: Float) -> Priority {
        let targetValue = self.subject.rawValue - abs(value)
        if targetValue > Priority.maxOptional.rawValue {
            return Priority.maxOptional
        } else if targetValue < Priority.minOptional.rawValue {
            return Priority.minOptional
        } else {
            return Priority(rawValue: targetValue)
        }
    }
    
    /// Get a higher priority (aka: `current + value`), max to `required - 1`
    public func higher(_ value: Float) -> Priority {
        let targetValue = self.subject.rawValue + abs(value)
        if targetValue > Priority.maxOptional.rawValue {
            return Priority.maxOptional
        } else if targetValue < Priority.minOptional.rawValue {
            return Priority.minOptional
        } else {
            return Priority(rawValue: targetValue)
        }
    }
}


/// StaticWood (Priority)
extension StaticWood where Subject == Priority {
    
    /// Minimum optional priority
    public var minOptional: Priority { Priority.minOptional }
    
    /// Maximum optional priority
    public var maxOptional: Priority { Priority.maxOptional }
}
