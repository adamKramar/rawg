// All rights reserved. Copyright © 2024 Adam Kramár.  

extension StoresResponse {
    var domain: [Store] {
        results.map { $0.domain }
    }
}

extension StoreResponse {
    var domain: Store {
        .init(
            id: id,
            name: name,
            backgroundImage: backgroundImage,
            gamesCount: gamesCount,
            games: games.map { $0.domain }
        )
    }
}

extension StoreGamesResponse {
    var domain: StoreGame {
        .init(
            id: id,
            name: name,
            added: added
        )
    }
}
