// All rights reserved. Copyright © 2024 Adam Kramár.  

struct RequestParameters {
    let path: String
    let parameters: Encodable?

    init(
        path: String = "",
        parameters: Encodable? = nil
    ) {
        self.path = path
        self.parameters = parameters
    }
}
