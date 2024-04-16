// All rights reserved. Copyright © 2024 Adam Kramár.  

import SwiftUI

class CustomHostingController<T: View>: UIHostingController<T> {
    init(
        rootView: T,
        accessibilityIdentifier: String? = nil
    ) {
        super.init(rootView: rootView)
        setupNavigationItem()

        if let accessibilityIdentifier = accessibilityIdentifier {
            view.accessibilityIdentifier = accessibilityIdentifier
        }

        view.backgroundColor = UIColor(resource: .dark)
    }

    @MainActor
    @objc
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }

    /// Fixes problems of UIKit navigation + SwiftUI.
    /// 1) When you navigate from inline title to large title (both set in SwiftUI view) and the target screen is ScrollView. The large title on target screen is scrolled so it appears as inline which is wrong. Without this you either need to also navigate from large title screen or the target screen cannot be ScrollView.
    /// 2) When you set navigationTitle on target screen in SwiftUI view and then you navigate to that screen, the title is not shown smoothly. It suddenly appears after the navigation.
    func setTitle(_ title: String, large mode: UINavigationItem.LargeTitleDisplayMode) {
        navigationItem.title = title
        navigationItem.largeTitleDisplayMode = mode
    }
}
