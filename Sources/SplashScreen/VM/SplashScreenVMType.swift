// All rights reserved. Copyright © 2024 Adam Kramár.  

import Combine

protocol SplashScreenVMType: SplashScreenVMInputs, SplashScreenVMOutputs {}

protocol SplashScreenVMInputs: ObservableObject {
    func getConfig() async
}

protocol SplashScreenVMOutputs {
    var state: SplashScreenState { get }
}

protocol SplashScreenVMActions {
    var onFinish: AnyPublisher<Void, Never> { get }
}
