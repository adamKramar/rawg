// All rights reserved. Copyright © 2024 Adam Kramár.  

final class RawgRepository: RawgRepositoryType {
    private let storesPath = "/stores"
    private let gamesPath = "/games"
    private let requester: Requesting

    init(requester: Requesting) {
        self.requester = requester
    }

    func getStores(request: StoresDemand) async throws -> StoresResponse {
        try await requester
            .getRequest(
                requestParams:
                    .init(
                        path: storesPath,
                        parameters: request.data
                    )
            )
    }

    func getGames(request: GamesDemand) async throws -> GamesResponse {
        try await requester
            .getRequest(
                requestParams:
                        .init(
                            path: gamesPath,
                            parameters: request.data
                        )
            )
    }
}
