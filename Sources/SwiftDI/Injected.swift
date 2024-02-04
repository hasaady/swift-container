//
//  Injected.swift
//  
//
//  Created by Hanan on 04/02/2024.
//

import Foundation

@propertyWrapper
public struct Injected<T> {
    private var dependency: T

    public init(_ type: T.Type) {
        self.dependency = Container.resolve(type)
    }

   public var wrappedValue: T {
        get { dependency }
        mutating set { dependency = newValue }
    }
}
