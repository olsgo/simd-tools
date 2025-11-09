// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "simd-tools",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "SIMDTools",
            targets: ["SIMDTools"]
        ),
    ],
    dependencies: [
        // Align with the swiftlang mirror used elsewhere (e.g. SnapshotTesting)
        // so SwiftPM sees a single swift-syntax identity during resolution.
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "602.0.0"),
    ],
    targets: [
        .macro(
            name: "SIMDToolsMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "SIMDTools", dependencies: ["SIMDToolsMacros"]),
        .testTarget(
            name: "SIMDToolsTests",
            dependencies: ["SIMDTools"]
        ),
    ]
)
