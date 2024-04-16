// All rights reserved. Copyright © 2024 Adam Kramár.  

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupDependencyResolver()

        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

// MARK: - AppDelegate + Private API
private extension AppDelegate {
    func setupDependencyResolver() {
        let assemblies: [DependencyAssembly] = [
            AppAssembler(),
            HomeAssembler()
        ]
        let dependencyHandler = SwinjectResolver(assemblies)
        SharedDependencyResolver.dependencyResolver = dependencyHandler
    }
}
