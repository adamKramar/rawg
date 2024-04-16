// All rights reserved. Copyright © 2024 Adam Kramár.  

struct Store {
    let id: Int
    let name: String
    let backgroundImage: String
    let gamesCount: Int
    let games: [StoreGame]
}

struct StoreGame {
    let id: Int
    let name: String
    let added: Int
}
