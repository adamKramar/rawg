// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

extension URL {
    func apply(parameters: [String: Any]?) -> URL {
        guard let parameters else { return self }

        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.compactMap { key, value in
            if let value = value as? String {
                return URLQueryItem(name: key, value: value)
            } else if let value = (value as? NSNumber)?.stringValue {
                return URLQueryItem(name: key, value: value)
            } else {
                return nil
            }
        }
        return components?.url ?? self
    }
}
