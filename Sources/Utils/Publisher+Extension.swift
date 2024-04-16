// All rights reserved. Copyright © 2024 Adam Kramár.  

import Combine
import Foundation

extension Publisher where Failure == Never {
    func sinkOnMain(receiveValue: @escaping (Output) -> Void) -> AnyCancellable {
        receive(on: DispatchQueue.main)
            .sink(receiveValue: receiveValue)
    }
}
