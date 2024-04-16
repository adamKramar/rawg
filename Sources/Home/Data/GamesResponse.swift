// All rights reserved. Copyright © 2024 Adam Kramár.  

struct GamesResponse: Decodable {
    let count: Int
    let results: [GameResponse]
}

struct GameResponse: Decodable {
    let id: Int
    let name: String
    let releaseDate: String?
    let backgroundImage: String?
    let rating: Double?
    let metacritic: Int?
    let platforms: [GamePlatformsResponse]?
    let genres: [GameGenresResponse]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case releaseDate = "released"
        case backgroundImage = "background_image"
        case rating
        case metacritic
        case platforms
        case genres
    }
}

struct GamePlatformsResponse: Decodable {
    let platform: GamePlatformResponse
}

struct GamePlatformResponse: Decodable {
    let id: Int
    let name: String
    let slug: String
}

struct GameGenresResponse: Decodable {
    let id: Int
    let name: String
}
