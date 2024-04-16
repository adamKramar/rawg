// All rights reserved. Copyright © 2024 Adam Kramár.  

struct StoresResponse: Decodable {
    let count: Int
    let results: [StoreResponse]
}

struct StoreResponse: Decodable {
    let id: Int
    let name: String
    let backgroundImage: String
    let gamesCount: Int
    let games: [StoreGamesResponse]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "image_background"
        case gamesCount = "games_count"
        case games
    }
}

struct StoreGamesResponse: Decodable {
    let id: Int
    let name: String
    let added: Int
}

// MARK: - 
