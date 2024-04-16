// All rights reserved. Copyright © 2024 Adam Kramár.  

protocol RawgRepositoryType {
    func getStores(request: StoresDemand) async throws -> StoresResponse
    func getGames(request: GamesDemand) async throws -> GamesResponse
}
