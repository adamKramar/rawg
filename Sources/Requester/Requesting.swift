// All rights reserved. Copyright © 2024 Adam Kramár.  

protocol Requesting {
    func getRequest<Response: Decodable>(requestParams: RequestParameters) async throws -> Response
}
