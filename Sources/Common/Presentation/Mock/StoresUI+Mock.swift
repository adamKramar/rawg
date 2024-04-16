// All rights reserved. Copyright © 2024 Adam Kramár.  

extension StoresUI {
    static var storesMock: StoresUI {
        .init(
            name: "Mock stores",
            stores: StoresUI.getStoreMocks(count: 3)
        )
    }

    static var storeGamesMock: [StoreGameUI] {
        let game1 = StoreGameUI(id: 0, name: "Grand Theft auto V", added: "67978")
        let game2 = StoreGameUI(id: 1, name: "The Witcher 3: Wild Hunt", added: "56128")
        let game3 = StoreGameUI(id: 2, name: "Portal 2", added: "42789")

        return [game1, game2, game3]
    }

    static func getStoreMocks(count: Int = 1) -> [StoreUI] {
        var result = [StoreUI]()
        for index in 0...count {
            result.append(
                StoreUI(
                    id: index,
                    title: "Steam",
                    imageUrl: "https://media.rawg.io/media/games/679/679d7a18e220025bdd83dff484d6ea64.jpg",
                    gamesCount: 200,
                    games: StoresUI.storeGamesMock
                )
            )
        }
        return result
    }
}
