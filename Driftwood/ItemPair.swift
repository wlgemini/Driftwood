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


/// ItemPair
public struct ItemPair {
    
    /// item
    public unowned(unsafe) let item: Item

    /// superitem
    public unowned(unsafe) let superitem: Item?
    
    // MARK: - Internal
    /// Backstore for item if any
    var anyStorage: Storage? {
        ItemPair.anyStorage(for: self.item)
    }
    
    /// Backstore for item
    var storage: Storage {
        ItemPair.storage(for: self.item)
    }
    
    /// Backstore for item if any
    static func anyStorage(for item: Item) -> Storage? {
        objc_getAssociatedObject(item, &ItemPair._storageKey) as? Storage
    }
    
    /// Backstore for item
    static func storage(for item: Item) -> Storage {
        if let s = self.anyStorage(for: item) {
            return s
        } else {
            let s = Storage()
            objc_setAssociatedObject(item, &ItemPair._storageKey, s, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return s
        }
    }
    
    /// init
    init(item: Item, superitem: Item?) {
        self.item = item
        self.superitem = superitem
    }
    
    // MARK: - Private
    /// _storage Key
    private static var _storageKey: Void?
}
