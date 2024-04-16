// All rights reserved. Copyright © 2024 Adam Kramár.  

extension StoresDemand {
    var data: StoresRequest {
        StoresRequest(
            pageSize: pageSize,
            orderBy: orderBy.rawValue
        )
    }
}
