// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

public enum RequestingError: LocalizedError {
    case underlyingLibError(error: Error)
    case internalError(description: String)
    case unauthorized
    case networkError(from: URLError)
    case httpError(code: Int)
    case parserError(error: Error)
    case internalServerError

    public var errorDescription: String? {
        switch self {
        case .underlyingLibError(let error):
            return "underlyingLibError: \(error.localizedDescription)"
        case .internalError(let description):
            return "internalError: \(description)"
        case .unauthorized:
            return "unauthorized"
        case .networkError(let error):
            return "networkError: \(error.localizedDescription)"
        case .httpError(let code):
            return "httpError: code: \(code)"
        case .parserError(let error):
            return "parserError: \(localizeDecodingError(error) ?? error.localizedDescription)"
        case .internalServerError:
            return "internalServerError"
        }
    }

    private func localizeDecodingError(_ error: Error) -> String? {
        guard let decodingError = error as? DecodingError else {
            return nil
        }

        switch decodingError {
        case let .dataCorrupted(context):
            return context.debugDescription
        case let .keyNotFound(_, context):
            return context.debugDescription
        case let .typeMismatch(_, context):
            return context.debugDescription
        case let .valueNotFound(_, context):
            return context.debugDescription
        @unknown default:
            return nil
        }
    }
}
