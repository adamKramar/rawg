// All rights reserved. Copyright © 2024 Adam Kramár.  

struct HomeAssembler: DependencyAssembly {
    func assemble(using container: DependencyRegistering) {
        assembleDomain(using: container)
        assemblePresentation(using: container)
    }
}

private extension HomeAssembler {
    

    func assembleDomain(using container: DependencyRegistering) {
        container.register(HomeUseCaseType.self) { resolving in
            HomeUseCase(repository: resolving.resolve())
        }
    }

    func assemblePresentation(using container: DependencyRegistering) {
        container.register(HomeVM.self) { resolving in
            HomeVM(homeUseCase: resolving.resolve())
        }

        container.register(CustomHostingController<HomeView>.self) { (_, viewModel: HomeVM) in
            CustomHostingController(rootView: HomeView(viewModel: viewModel))
        }
    }
}
