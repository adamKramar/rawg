// All rights reserved. Copyright © 2024 Adam Kramár.  

extension GamesUI {
    static var gamesMock: GamesUI {
        .init(
            name: "Games mock",
            games: getGamesMocks(count: 7)
        )
    }

    static var gameInfoMock: [GameInfoUI] {
        let relaseDate = GameInfoUI.releaseDate("10.12.2023")
        let genres = GameInfoUI.genres("Action")
        let rating = GameInfoUI.rating("4.7/5")

        return [relaseDate, genres, rating]
    }

    static var gamePlatformsMock: [GamePlatformUI]? {
        guard
            let pcPlatform = GamePlatformUI(rawValue: "windows"),
            let psPlatform = GamePlatformUI(rawValue: "playstation"),
            let macPlafrom = GamePlatformUI(rawValue: "mac")
        else {
            return nil
        }

        return [pcPlatform, psPlatform, macPlafrom]
    }

    static func mock(id: Int) -> GameUI {
        .init(
            id: id,
            name: "Grand Theft Auto V",
            imageUrl: "https://media.rawg.io/media/games/679/679d7a18e220025bdd83dff484d6ea64.jpg",
            metacriticRating: 95,
            gameInfo: GamesUI.gameInfoMock,
            platforms: GamesUI.gamePlatformsMock
        )
    }

    static func getGamesMocks(count: Int = 1) -> [GameUI] {
        var result = [GameUI]()
        for index in 0...count {
            result.append(GamesUI.mock(id: index))
        }
        return result
    }
}
