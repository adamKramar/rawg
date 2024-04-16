// All rights reserved. Copyright © 2024 Adam Kramár.  

import UIKit

final class HomeCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let viewModel: HomeVM = SharedDependencyResolver.dependencyResolver.resolve()
        let viewController: CustomHostingController<HomeView<HomeVM>>
            = SharedDependencyResolver.dependencyResolver.resolve(argument: viewModel)

        navigationController.setViewControllers([viewController], animated: false)
    }
}
