// All rights reserved. Copyright © 2024 Adam Kramár.  

import UIKit

extension UIViewController {
    func setupNavigationItem() {
        navigationItem.standardAppearance = UIViewController.appearance(backgroundColor: UIColor(resource: .dark))
        navigationItem.scrollEdgeAppearance = UIViewController.appearance(backgroundColor: nil)
        navigationItem.backButtonDisplayMode = .minimal
    }
}

private extension UIViewController {
    static func appearance(backgroundColor: UIColor?) -> UINavigationBarAppearance {
        let scrollAppearance = UINavigationBarAppearance()

        scrollAppearance.configureWithTransparentBackground()
        scrollAppearance.shadowImage = nil
        scrollAppearance.shadowColor = nil
        scrollAppearance.backgroundColor = backgroundColor
        scrollAppearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)

        return scrollAppearance
    }
}
