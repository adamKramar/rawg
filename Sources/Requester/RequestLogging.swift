// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

struct RequestLogLevel: OptionSet {
    let rawValue: UInt8

    static let none: RequestLogLevel = []
    static let url = RequestLogLevel(rawValue: 1)
    static let headers = RequestLogLevel(rawValue: 0b11)
    static let body = RequestLogLevel(rawValue: 0b101)
    static let full: RequestLogLevel = [.url, .headers, .body]
}

extension URLRequest {
    var urlDebugDescription: String {
        var debugString = "⬆️ "

        if let method = httpMethod {
            debugString += "\(method) "
        }

        if let urlString = url?.absoluteString {
            debugString += urlString
        }

        return debugString
    }

    var headersDebugDescription: String? {
        let headers = allHTTPHeaderFields ?? [:]
        if !headers.isEmpty {
            var debugString = "----- HEADERS -----"
            for (key, value) in headers {
                debugString += "\n\(key): \(value)"
            }
            return debugString
        }

        return nil
    }

    var bodyDebugDescription: String? {
        if let data = httpBody {
            return "----- BODY -----\n\(data.prettyPrintedJSON)"
        }

        return nil
    }
}

extension HTTPURLResponse {
    var statusCodeIcon: String {
        switch statusCode {
        case 100...199:
            return "ℹ️"
        case 200...299:
            return "✅"
        case 300...399:
            return "↪️"
        case 400...499:
            return "⚠️"
        case 500...599:
            return "❌"
        default:
            return ""
        }
    }

    open override var debugDescription: String {
        "⬇️ \(url?.absoluteString ?? "") [\(statusCode) \(statusCodeIcon)]"
    }
}

extension Data {
    var prettyPrintedJSON: String {
        if let json = try? JSONSerialization.jsonObject(with: self, options: []),
            let prettyData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted]),
            let prettyString = String(data: prettyData, encoding: .utf8) {
            return prettyString
        } else if let jsonString = String(data: self, encoding: .utf8) {
            return jsonString
        }

        return ""
    }
}
