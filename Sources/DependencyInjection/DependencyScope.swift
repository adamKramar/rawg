// All rights reserved. Copyright © 2024 Adam Kramár.  

enum DependencyScope {
    /// A new instance is always created by the `Container` when a type is resolved.
    /// The instance is not shared.
    case transient

    /// Instances are shared only when an object graph is being created,
    /// otherwise a new instance is created by the `Container`.
    case graph

    /// An instance provided by the `Container` is shared within the `Container` and its child `Containers`.
    case container

    /// An instance provided by the `Container` is shared within the `Container` and its child `Container`s
    /// as long as there are strong references to given instance. Otherwise new instance is created
    /// when resolving the type.
    case weak
}
