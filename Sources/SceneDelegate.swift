// All rights reserved. Copyright © 2024 Adam Kramár.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var rootCoordinator: RootCoordinator?
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()

        rootCoordinator = RootCoordinator(window: window)
        rootCoordinator?.start()
    }
}
