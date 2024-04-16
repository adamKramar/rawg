// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

final class AsyncCacheableImage: NSObject, NSDiscardableContent {
    let image: Image

    init(_ image: Image) {
        self.image = image
    }

    func beginContentAccess() -> Bool {
        return true
    }

    func endContentAccess() {
        // Empty protocol implementation
    }

    func discardContentIfPossible() {
        // Empty protocol implementation
    }

    func isContentDiscarded() -> Bool {
        return false
    }
}

struct AsyncImageCache {
    private static let cache = NSCache<NSURL, AsyncCacheableImage>()

    static subscript(_ key: URL) -> Image? {
        get { cache.object(forKey: key as NSURL)?.image }
        set {
            if let newValue = newValue {
                cache.setObject(.init(newValue), forKey: key as NSURL)
            } else {
                cache.removeObject(forKey: key as NSURL)
            }
        }
    }
}
