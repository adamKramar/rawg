// All rights reserved. Copyright © 2024 Adam Kramár.  

import Combine

final class SplashScreenVM: SplashScreenVMType, SplashScreenVMActions {
    // MARK: - Properties
    private let onFinishSubject = PassthroughSubject<Void, Never>()

    // MARK: - Outputs
    @Published private(set)var state: SplashScreenState = .loading

    // MARK: - Actions
    var onFinish: AnyPublisher<Void, Never> {
        onFinishSubject.eraseToAnyPublisher()
    }

    // MARK: - Inputs
    func getConfig() async {
        // load remote config here
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        onFinishSubject.send()
    }
}
