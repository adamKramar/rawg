// All rights reserved. Copyright © 2024 Adam Kramár.  

protocol DependencyHandling: DependencyRegistering, DependencyResolving {}

// MARK: - DependencyRegistering
protocol DependencyRegistering {
    func register<Service>(
        _ serviceType: Service.Type,
        scope: DependencyScope?,
        factory: @escaping (DependencyResolving) -> Service
    )
    func register<Service, Arg1>(
        _ serviceType: Service.Type,
        scope: DependencyScope?,
        factory: @escaping (DependencyResolving, Arg1) -> Service
    )
}

extension DependencyRegistering {
    func register<Service>(
        _ serviceType: Service.Type,
        scope: DependencyScope? = nil,
        factory: @escaping (DependencyResolving) -> Service
    ) {
        register(serviceType, scope: scope, factory: factory)
    }

    func register<Service, Arg1>(
        _ serviceType: Service.Type,
        scope: DependencyScope? = nil,
        factory: @escaping (DependencyResolving, Arg1) -> Service
    ) {
        register(serviceType, scope: scope, factory: factory)
    }
}

// MARK: - DependencyResolving
protocol DependencyResolving {
    func resolve<Service>(_ serviceType: Service.Type) -> Service
    func resolve<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service
}

extension DependencyResolving {
    func resolve<Service>(_ serviceType: Service.Type = Service.self) -> Service {
        resolve(serviceType)
    }
    func resolve<Service, Arg1>(_ serviceType: Service.Type = Service.self, argument: Arg1) -> Service {
        resolve(serviceType, argument: argument)
    }
}
