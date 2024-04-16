// All rights reserved. Copyright © 2024 Adam Kramár.  

import Foundation

final class HomeUseCase: HomeUseCaseType {
    private let repository: RawgRepositoryType

    init(repository: RawgRepositoryType) {
        self.repository = repository
    }

    func getTopStores(pageLimit: UInt) async throws -> [Store] {
        let demand = StoresDemand(
            pageSize: pageLimit,
            orderBy: .added
        )
        return try await repository.getStores(request: demand).domain
    }

    func getMostPopularGames(pageLimit: UInt) async throws -> [Game] {
        let demand = GamesDemand(
            pageSize: pageLimit,
            dates: "2023-01-01,2023-12-31",
            orderBy: .metacritic
        )
        return try await repository.getGames(request: demand).domain
    }

    func getMostAnticipatedGames(pageLimit: UInt) async throws -> [Game] {
        let startDateString = DateFormatters.convertToApiDateString(date: Date.now)
        let endDate = Calendar.current.date(byAdding: .year, value: 1, to: Date.now)
        let endDateString = DateFormatters.convertToApiDateString(date: endDate ?? Date.now)
        let demand = GamesDemand(
            pageSize: pageLimit,
            dates: [startDateString, endDateString].joined(separator: ","),
            orderBy: .added
        )
        return try await repository.getGames(request: demand).domain
    }
}
