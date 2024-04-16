// All rights reserved. Copyright © 2024 Adam Kramár.  

struct Game {
    let id: Int
    let name: String
    let releaseDate: String?
    let backgroundImage: String?
    let rating: Double?
    let metacritic: Int?
    let platforms: [GamePlatform]?
    let genres: [GameGenre]?
}

struct GamePlatform {
    let id: Int
    let name: String
    let slug: String
}

struct GameGenre {
    let id: Int
    let name: String
}
