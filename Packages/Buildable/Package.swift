// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Buildable",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Buildable",
            targets: ["Buildable"]),
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
            dependencies: ["Buildable"]),
    ]
)
