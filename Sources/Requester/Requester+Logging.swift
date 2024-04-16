// All rights reserved. Copyright © 2024 Adam Kramár.  

import Alamofire
import Foundation

extension Requester {
    func logResponse<Response>(response: AFDataResponse<Response>, logLevel: RequestLogLevel) {
        if logLevel.contains(.url), let httpUrlResponse = response.response {
            print(httpUrlResponse.debugDescription)
        }

        if logLevel.contains(.headers) {
            response.response?.printHeaders()
        }

        guard
            logLevel.contains(.body),
            let data = response.data,
            !data.prettyPrintedJSON.isEmpty
        else {
            return
        }

        print("----- BODY -----")
        print(data.prettyPrintedJSON)
    }

    func logRequest(_ request: URLRequest, logLevel: RequestLogLevel) {
        if logLevel.contains(.url) {
            print(request.urlDebugDescription)
        }

        if logLevel.contains(.headers), let headers = request.headersDebugDescription {
            print(headers)
        }

        if logLevel.contains(.body), let body = request.bodyDebugDescription {
            print(body)
        }
    }
}

// MARK: - HTTPURLResponse + Print headers
private extension HTTPURLResponse {
    func printHeaders() {
        guard !allHeaderFields.isEmpty else { return }

        print("----- HEADERS -----")
        allHeaderFields.forEach {
            print("\($0.key): \($0.value)")
        }
    }
}
