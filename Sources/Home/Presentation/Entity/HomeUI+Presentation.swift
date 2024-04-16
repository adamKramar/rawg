// All rights reserved. Copyright © 2024 Adam Kramár.  

extension HomeUI {
    init(
        stores: [Store],
        topGames: [Game],
        anticipatedGames: [Game]
    ) {
        let stores = stores.map { StoreUI(domain: $0) }
        self.stores = StoresUI(name: "Most popular stores", stores: stores)
        let topGames = topGames.map { GameUI(domain: $0) }
        self.topGames = GamesUI(name: "Top games of 2023", games: topGames)
        let anticipatedGames = anticipatedGames.map { GameUI(domain: $0) }
        self.anticipatedGames = GamesUI(name: "Most anticipated games", games: anticipatedGames)
    }
}
