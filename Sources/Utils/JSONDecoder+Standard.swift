// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

extension JSONDecoder {
    static var standard: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return decoder
    }
}
