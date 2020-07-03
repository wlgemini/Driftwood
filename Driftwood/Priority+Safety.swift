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


/// Priority (Safety)
extension Priority {
    
    /// Min optional priority
    static let minOptional: Self = Self(rawValue: 1)
    
    /// Max optional priority
    static let maxOptional: Self = Self(rawValue: Self.required.rawValue - 1)
    
    /// Check is valid priority
    ///
    /// Priority can not lower than 1 or higher than required
    static func isValidPriority(_ priority: Self) -> Bool {
        priority.rawValue >= Self.minOptional.rawValue && priority.rawValue <= Self.required.rawValue
    }
    
    /// Check is safe to change priority
    ///
    /// Constraint's priority may only be modified as part of initial set up or when optional.
    /// After a constraint has been added to a view, an exception will be thrown if the priority is changed from/to Priority.required.
    static func isSafeToChangePriority(from: Self, to: Self) -> Bool {
        if from.rawValue == to.rawValue {
            // same priority has no effect, so it's safe
            return true
        } else {
            // it's safe when `from` && `to` is optional
            return from.rawValue < Self.required.rawValue && to.rawValue < Self.required.rawValue
        }
    }
}
