// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SwiftIContainer",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "SwiftIContainer",
            targets: ["SwiftIContainer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftIContainer"
        ),
        .testTarget(
            name: "SwiftIContainerTests",
            dependencies: ["SwiftIContainer"]),
    ]
)
