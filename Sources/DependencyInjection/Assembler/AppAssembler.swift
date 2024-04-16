// All rights reserved. Copyright © 2024 Adam Kramár.  

struct AppAssembler: DependencyAssembly {
    func assemble(using container: DependencyRegistering) {
        assembleRequester(using: container)
        assembleData(using: container)
        assembleSplashScreen(using: container)
    }
}

// MARK: - AppAssembler + Private API
private extension AppAssembler {
    func assembleRequester(using container: DependencyRegistering) {
        container.register(Requesting.self, scope: .container) { _ in
            Requester()
        }
    }

    func assembleData(using container: DependencyRegistering) {
        container.register(RawgRepositoryType.self) { resolving in
            RawgRepository(requester: resolving.resolve())
        }
    }

    func assembleSplashScreen(using container: DependencyRegistering) {
        container.register(SplashScreenVM.self, scope: .container) { _ in
            SplashScreenVM()
        }
        container.register(CustomHostingController<SplashScreenView>.self) { (_, viewModel: SplashScreenVM) in
            CustomHostingController(rootView: SplashScreenView(viewModel: viewModel))
        }
    }
}
