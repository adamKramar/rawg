// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

final class HomeVM: HomeVMType {
    // MARK: - Propertis
    private let homeUseCase: HomeUseCaseType
    private let storesCount: UInt = 5
    private let gamesCount: UInt = 7

    // MARK: - Outputs
    @MainActor @Published private(set) var state: HomeState = .loading

    // MARK: - Initiazlization
    init(homeUseCase: HomeUseCaseType) {
        self.homeUseCase = homeUseCase
    }

    // MARK: - Inputs
    func getHomeScreenData() async {
        do {
            async let stores = getStores()
            async let topGames = getTopGames()
            async let anticipatedGames = getAnticipatedGames()
            let homeUI = try await HomeUI(stores: stores, topGames: topGames, anticipatedGames: anticipatedGames)

            await updateState(with: .loaded(homeUI))
        } catch {
            print(error)
            // TODO: Error handling
        }
    }
 }

// MARK: - HomeVM + Private API
private extension HomeVM {
    @MainActor
    func updateState(with state: HomeState) async {
        self.state = state
    }

    func getStores() async throws -> [Store] {
        try await homeUseCase.getTopStores(pageLimit: storesCount)
    }

    func getTopGames() async throws -> [Game] {
        try await homeUseCase.getMostPopularGames(pageLimit: gamesCount)
    }

    func getAnticipatedGames() async throws -> [Game] {
        try await homeUseCase.getMostAnticipatedGames(pageLimit: gamesCount)
    }
}
