// All rights reserved. Copyright © 2024 Adam Kramár.  

extension HomeUI {
    static var mock: HomeUI {
        .init(
            stores: StoresUI.storesMock,
            topGames: GamesUI.gamesMock,
            anticipatedGames: GamesUI.gamesMock
        )
    }
}
