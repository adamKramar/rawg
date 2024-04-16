// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

protocol HomeVMType: HomeVMInputs, HomeVMOutputs {}

protocol HomeVMInputs: ObservableObject {
    func getHomeScreenData() async
}

protocol HomeVMOutputs {
    var state: HomeState { get }
}
