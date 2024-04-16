// All rights reserved. Copyright © 2024 Adam Kramár.  

extension StoreUI {
    init(domain: Store) {
        id = domain.id
        title = domain.name
        imageUrl = domain.backgroundImage
        gamesCount = domain.gamesCount
        games = domain.games.prefix(3).map {
            StoreGameUI(id: $0.id, name: $0.name, added: String($0.added))
        }
    }
 }
