// All rights reserved. Copyright © 2024 Adam Kramár.  

protocol HomeUseCaseType {
    func getTopStores(pageLimit: UInt) async throws -> [Store]
    func getMostPopularGames(pageLimit: UInt) async throws -> [Game]
    func getMostAnticipatedGames(pageLimit: UInt) async throws -> [Game]
}
