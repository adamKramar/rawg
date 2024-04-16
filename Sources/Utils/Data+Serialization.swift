// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

extension Data {
    static func serialize<T: Encodable>(data: T, convertToSnakeCase: Bool = false) throws -> Data {
        let encoder = JSONEncoder()
        if convertToSnakeCase {
             encoder.keyEncodingStrategy = .convertToSnakeCase
        }
        return try encoder.encode(data)
    }

    static func serializeToDictionary<T: Encodable>(data: T, convertToSnakeCase: Bool = false) -> [String: Any] {
        (try? Data.serialize(data: data, convertToSnakeCase: convertToSnakeCase))?.dictionary ?? [:]
    }

    var dictionary: [String: Any] {
        let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [String: Any]
        return json ?? [:]
    }
}
