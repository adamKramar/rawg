// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

final class RootCoordinator: BaseCoordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start() {
        openSplashScreen()
    }
}

// MARK: - RootCoordinator + Private API
private extension RootCoordinator {
    func openSplashScreen() {
        let viewModel: SplashScreenVM = SharedDependencyResolver.dependencyResolver.resolve()
        let viewController: CustomHostingController<SplashScreenView<SplashScreenVM>> 
            = SharedDependencyResolver.dependencyResolver.resolve(argument: viewModel)

        setupSplashScreenActions(with: viewModel)

        let navigationController = UINavigationController()
        navigationController.setViewControllers([viewController], animated: false)

        window.rootViewController = navigationController
    }

    func setupSplashScreenActions(with actions: SplashScreenVMActions) {
        actions.onFinish
            .sinkOnMain { [weak self] in
                self?.showTabBarController()
            }
            .store(in: &cancellables)
    }

    func showTabBarController() {
        let tabBarVC = CustomTabBarController()

        window.rootViewController = tabBarVC
        tabBarVC.viewControllers = [
            makeHomeTabBarItem(),
            makeCategoryTabBarItem(),
            makeSearchTabBarItem()
        ]
        tabBarVC.selectedIndex = 0
    }

    func makeHomeTabBarItem() -> UINavigationController {
        let homeNC = UINavigationController()

        homeNC.tabBarItem.image = UIImage(resource: .home)
        homeNC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        startChildCoordinator(HomeCoordinator(navigationController: homeNC))

        return homeNC
    }

    func makeCategoryTabBarItem() -> UINavigationController {
        let categoryNC = UINavigationController()

        categoryNC.tabBarItem.image = UIImage(resource: .category)
        categoryNC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        return categoryNC
    }

    func makeSearchTabBarItem() -> UINavigationController {
        let searchNC = UINavigationController()

        searchNC.tabBarItem.image = UIImage(resource: .search)
        searchNC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        return searchNC
    }
}
