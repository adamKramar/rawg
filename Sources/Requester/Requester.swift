// All rights reserved. Copyright © 2024 Adam Kramár.  

import Alamofire
import Foundation

final class Requester: Requesting {
    let session: Session
    let logLevel: RequestLogLevel

    init() {
        session = .init(configuration: .default)
        #if DEBUG
        logLevel = .full
        #else
        logLevel = .none
        #endif
    }

    func getRequest<Response: Decodable>(requestParams: RequestParameters) async throws -> Response {
        let url = try await getUrl(requestParams: requestParams)
        let params = requestParams.parameters.map { Data.serializeToDictionary(data: $0) }
        let request = URLRequest.get(
            url: url,
            parameters: params
        )

        logRequest(request, logLevel: logLevel)

        return try await performRequest(request)
    }
}

// MARK: - Requester + Private API
private extension Requester {
    func performRequest<Response: Decodable>(_ request: URLRequest) async throws -> Response {
        let response = await session
            .request(request)
            .validate()
            .serializingDecodable(Response.self, decoder: JSONDecoder.standard)
            .response

        logResponse(response: response, logLevel: self.logLevel)

        return try await handleResponse(afResponse: response)
    }

    func handleResponse<Response>(afResponse: DataResponse<Response, AFError>) async throws -> Response {
        // URL errors
        if let urlError = afResponse.error?.underlyingError as? URLError {
            switch urlError.code {
            case .networkConnectionLost, .notConnectedToInternet, .dataNotAllowed, .internationalRoamingOff:
                throw RequestingError.networkError(from: urlError)
            default:
                break
            }
        }
        // Decoding and other Alamofire errors
        if let afError = afResponse.error {
            switch afError {
            case .responseSerializationFailed:
                throw RequestingError.parserError(error: afError)
            case .responseValidationFailed(reason: .unacceptableStatusCode):
                // server response handled in handleServerResponseStatusCode func
                break
            default:
                throw RequestingError.underlyingLibError(error: afError)
            }
        }
        return try await handleServerResponseStatusCode(afResponse: afResponse)
    }

    func handleServerResponseStatusCode<Response>(
        afResponse: DataResponse<Response, AFError>
    ) async throws -> Response {
        guard let httpResponse = afResponse.response else {
            throw RequestingError.internalError(description: "HTTPURLResponse from Alamofire's DataResponse is nil")
        }

        switch httpResponse.statusCode {
        case 200..<400:
            guard let value = afResponse.value else {
                throw RequestingError.internalServerError
            }

            return value
        case 401:
            throw RequestingError.unauthorized
        case 400, 402..<500:
            throw RequestingError.httpError(code: httpResponse.statusCode)
        default:
            throw RequestingError.internalServerError
        }
    }

    func getUrl(requestParams: RequestParameters) async throws -> URL {
        let urlString = Constants.rawgBaseUrl + requestParams.path
        guard let url = URL(string: urlString) else {
            throw RequestingError.internalError(
                description: "Could not create url from string \(urlString)"
            )
        }

        return url
    }
}
