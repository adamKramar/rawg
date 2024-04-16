// All rights reserved. Copyright © 2024 Adam Kramár.  

extension GameUI {
    init(domain: Game) {
        id = domain.id
        name = domain.name
        imageUrl = domain.backgroundImage ?? ""
        metacriticRating = domain.metacritic
        gameInfo = GameUI.createGameInfo(from: domain)
        platforms = GameUI.createPlaformArray(from: domain)
    }

    static func createGameInfo(from domain: Game) -> [GameInfoUI] {
        var gameInfo = [GameInfoUI]()
        let releaseDate = DateFormatters.convertFromApiDate(apiDate: domain.releaseDate ?? "") ?? "TBA"
        gameInfo.append(.releaseDate(releaseDate))
        let genresString = domain.genres?.map { $0.name }.joined(separator: ", ") ?? "TBA"
        gameInfo.append(.genres(genresString))
        let rating = domain.rating != nil ? "\(String(format: "%.1f", domain.rating ?? 0))/5" : "TBA"
        gameInfo.append(.rating(rating))
        return gameInfo
    }

    static func createPlaformArray(from domain: Game) -> [GamePlatformUI]? {
        domain.platforms?.compactMap { GamePlatformUI(rawValue: $0.slug) }
    }
}
