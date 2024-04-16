// All rights reserved. Copyright © 2024 Adam Kramár.  

struct StoresRequest: Encodable {
    let pageSize: UInt
    let orderBy: String

    enum CodingKeys: String, CodingKey {
        case pageSize = "page_size"
        case orderBy = "ordering"
    }
}
