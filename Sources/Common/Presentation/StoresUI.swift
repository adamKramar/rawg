// All rights reserved. Copyright © 2024 Adam Kramár.  

struct StoresUI {
    let name: String
    let stores: [StoreUI]
}

struct StoreUI: Identifiable {
    let id: Int
    let title: String
    let imageUrl: String
    let gamesCount: Int
    let games: [StoreGameUI]

    var gamesCountString: String {
        String(gamesCount)
    }
}

struct StoreGameUI: Identifiable {
    let id: Int
    let name: String
    let added: String
}
