// All rights reserved. Copyright © 2024 Adam Kramár.  

extension Array where Element: Equatable {
    mutating func removeItem(_ item: Element) {
        guard let index = firstIndex(of: item) else {
            print("Index not valid in removeItem(_:) for \(item)")
            return
        }
        remove(at: index)
    }
}
