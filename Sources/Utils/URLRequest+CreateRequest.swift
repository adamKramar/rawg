// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

extension URLRequest {
    static func get(
        url: URL,
        parameters: [String: Any]? = nil
    ) -> URLRequest {
        var paramsWithKey = [String: Any]()
        if let unwrappedParams = parameters {
            paramsWithKey = unwrappedParams
        }
        paramsWithKey["key"] = Constants.rawgApiKey
        let requestUrl = url.apply(parameters: paramsWithKey)
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "GET"

        urlRequest.addDefaultHeaders()

        return urlRequest
    }

    private mutating func addDefaultHeaders() {
        addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
