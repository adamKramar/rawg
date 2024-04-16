// All rights reserved. Copyright © 2024 Adam Kramár.  

extension GamesResponse {
    var domain: [Game] {
        results.map { $0.domain }
    }
}

extension GameResponse {
    var domain: Game {
        .init(
            id: id,
            name: name,
            releaseDate: releaseDate,
            backgroundImage: backgroundImage,
            rating: rating,
            metacritic: metacritic,
            platforms: platforms?.map {
                .init(id: $0.platform.id, name: $0.platform.name, slug: $0.platform.slug)
            },
            genres: genres?.map {
                .init(id: $0.id, name: $0.name)
            }
        )
    }
}
