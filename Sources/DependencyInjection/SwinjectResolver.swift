// All rights reserved. Copyright © 2024 Adam Kramár.  

import Swinject

final class SwinjectResolver: DependencyHandling {
    private let container = Container()

    init(_ assemblies: [DependencyAssembly]) {
        assemblies.forEach { $0.assemble(using: self) }
    }

    var synchronizedResolver: Swinject.Resolver {
        container.synchronize()
    }

    func register<Service>(
        _ serviceType: Service.Type,
        scope: DependencyScope?,
        factory: @escaping (DependencyResolving) -> Service
    ) {
        container.register(
            serviceType,
            factory: FactoryWrapper(
                resolving: self,
                factoryFunc: factory
            ).factory
        )
        .inObjectScope(getObjectScope(scope ?? DependencyScope.transient))
    }

    func register<Service, Arg1>(
        _ serviceType: Service.Type,
        scope: DependencyScope?,
        factory: @escaping (DependencyResolving, Arg1) -> Service
    ) {
        container.register(
            serviceType,
            factory: FactoryArg1Wrapper(
                resolving: self,
                factoryFunc: factory
            ).factory
        )
        .inObjectScope(getObjectScope(scope ?? DependencyScope.transient))
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        synchronizedResolver.resolve(serviceType)!
    }

    func resolve<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        synchronizedResolver.resolve(serviceType, argument: argument)!
    }
}

// MARK: - SwinjectResolver + Private API
private extension SwinjectResolver {
    struct FactoryWrapper<Service> {
        let resolving: DependencyResolving
        let factoryFunc: (DependencyResolving) -> Service

        func factory (resolver: Resolver) -> Service {
            return factoryFunc(resolving)
        }
    }

    struct FactoryArg1Wrapper<Service, Arg1> {
        let resolving: DependencyResolving
        let factoryFunc: (DependencyResolving, Arg1) -> Service

        func factory (resolver: Resolver, arg1: Arg1) -> Service {
            return factoryFunc(resolving, arg1)
        }
    }

    func getObjectScope(_ dependencyScope: DependencyScope) -> ObjectScope {
        switch dependencyScope {
        case .graph:
            return ObjectScope.graph
        case .container:
            return ObjectScope.container
        case .transient:
            return ObjectScope.transient
        case .weak:
            return ObjectScope.weak
        }
    }
}
