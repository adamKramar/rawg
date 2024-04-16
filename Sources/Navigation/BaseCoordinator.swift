// All rights reserved. Copyright © 2024 Adam Kramár.  

import Combine
import Foundation

class BaseCoordinator: NSObject {
    private(set) var children = [BaseCoordinator]()
    weak var parent: BaseCoordinator?
    var cancellables = Set<AnyCancellable>()

    lazy var rootControllerDeinit: () -> Void = { [weak self] in self?.finish() }

    /// Automatically send value in `finish` and subscribe in `start`.
    private var onEnd: (BaseCoordinator) -> Void = { _ in }

    deinit {
        print("Deinit of coordinator \(self)")
    }

    // MARK: - Lifecycle

    /// Perform initial navigation navigation.
    ///
    /// ⚠️ This method should be overriden.
    func start() {
        preconditionFailure("This method should be overriden by every coordinator")
    }

    ///
    /// Add coordinator to children, set it's parent to self, setup finist observation and start flow.
    ///
    /// - parameters:
    ///     - coordinator: Coordinator, which will be added to children
    func startChildCoordinator(_ coordinator: BaseCoordinator) {
        children.append(coordinator)
        coordinator.parent = self
        coordinator.start()
        coordinator.onEnd = { [weak self] in
            self?.removeChild($0)
        }
    }

    private func removeChild(_ child: BaseCoordinator) {
        children.removeItem(child)
    }

    /// Notifies parent coordinator, about removal.
    ///
    /// ⚠️ When overriding this method, make sure you cal `super.finish`, otherwise coordinator won't send message to parent.
    func finish() {
        onEnd(self)
    }

    func removeChildren() {
        children.removeAll()
    }
}
