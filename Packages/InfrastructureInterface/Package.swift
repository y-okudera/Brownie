// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InfrastructureInterface",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "InfrastructureInterface",
            targets: ["InfrastructureInterface"]),
    ],
    dependencies: [
        .package(name: "Entity", path: "../Entity"),
    ],
    targets: [
        .target(
            name: "InfrastructureInterface",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
            ]
        ),
        .testTarget(
            name: "InfrastructureInterfaceTests",
            dependencies: ["InfrastructureInterface"]),
    ]
)
