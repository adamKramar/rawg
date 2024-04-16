// All rights reserved. Copyright © 2024 Adam Kramár.  

extension GamesDemand {
    var data: GamesRequest {
        GamesRequest(
            pageSize: pageSize,
            orderBy: orderBy.rawValue,
            dates: dates
        )
    }
}
