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


/// Priority (Safer)
extension Priority {
    
    /// Get a lower priority (aka: `current - 1`), min to `1`
    public var lower: Priority {
        if self.rawValue <= Priority.minOptional.rawValue {
            return Priority.minOptional
        } else {
            return Priority(rawValue: self.rawValue - 1)
        }
    }
    
    /// Get a higher priority (aka: `current + 1`), max to `required - 1`
    public var higher: Priority {
        if self.rawValue >= Priority.maxOptional.rawValue {
            return Priority.maxOptional
        } else {
            return Priority(rawValue: self.rawValue + 1)
        }
    }
    
    // MARK: - Internal
    /// Min optional priority
    static let minOptional: Priority = Priority(rawValue: 1)
    
    /// Max optional priority
    static let maxOptional: Priority = Priority(rawValue: Priority.required.rawValue - 1)
    
    /// Check priority update is
    ///
    /// Constraint's priority may only be modified as part of initial set up or when optional.
    /// After a constraint has been added to a view, an exception will be thrown if the priority is changed from/to Priority.required.
    static func isSafeToUpdatePriority(from: Priority, to: Priority) -> Bool {
        // `from` && `to` is optional
        let isOptional = from.rawValue < Priority.required.rawValue && to.rawValue < Priority.required.rawValue
        
        // `to` is valid
        let isValid = to.rawValue >= Priority.minOptional.rawValue
        
        // isOptional && isValid
        return isOptional && isValid
    }
}
