//
//  Container.swift
//
//
//  Created by Hanan on 04/02/2024.
//

import Foundation

final class Container {
    private static let shared = Container()
    private var factories = [String: () -> Any]()
    private var singletons = [String: Any]()

    private init() {}

    public static func register<T>(type: T.Type, factory: @escaping () -> T) {
        Container.shared.factories[String(describing: type)] = factory
    }

    public static func register<T>(type: T.Type, singleton: T) {
        Container.shared.singletons[String(describing: type)] = singleton
    }
    
    static func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)

        // Return singleton instance if it exists
        if let singleton = Container.shared.singletons[key] as? T {
            return singleton
        }

        // Otherwise, create a new instance using the factory
        if let factory = Container.shared.factories[key]?() as? T {
            return factory
        }

        fatalError("No registered entry for \(T.self)")
    }
    
}
