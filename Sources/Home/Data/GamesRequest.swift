// All rights reserved. Copyright © 2024 Adam Kramár.  

struct GamesRequest: Encodable {
    let pageSize: UInt
    let orderBy: String
    let dates: String

    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case orderBy = "ordering"
        case dates
    }
}
