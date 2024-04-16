// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

class CustomTabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)

        let barAppearance = UITabBarAppearance()
        // setup tab bar for iPhone portrait mode
        setupTabBarStyle(with: barAppearance.stackedLayoutAppearance)
        // setup tab bar for iPad
        setupTabBarStyle(with: barAppearance.inlineLayoutAppearance)

        barAppearance.backgroundColor = UIColor(resource: .dark)
        tabBar.standardAppearance = barAppearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTabBarController {
    func setupTabBarStyle(with barItemAppearance: UITabBarItemAppearance) {
        // normal state
        barItemAppearance.normal.iconColor = UIColor(resource: .darkSilver)
        // selected state
        barItemAppearance.selected.iconColor = .red
    }
}
