// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Buildable",
            targets: ["Buildable"]
        ),
        .library(
            name: "ExtensionCompatible",
            targets: ["ExtensionCompatible"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/uber/needle.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "Buildable",
            dependencies: [
                .product(name: "NeedleFoundation", package: "needle"),
            ]
        ),
        .testTarget(
            name: "BuildableTests",
            dependencies: [
                "Buildable",
            ]
        ),
        .target(
            name: "ExtensionCompatible",
            dependencies: []
        ),
        .testTarget(
            name: "ExtensionCompatibleTests",
            dependencies: [
                "ExtensionCompatible",
            ]
        )
    ]
)
