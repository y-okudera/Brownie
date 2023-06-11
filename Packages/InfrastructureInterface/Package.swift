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
        .package(name: "Buildable", path: "../Buildable"),
    ],
    targets: [
        .target(
            name: "InfrastructureInterface",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
                .product(name: "Buildable", package: "Buildable"),
            ]
        ),
        .testTarget(
            name: "InfrastructureInterfaceTests",
            dependencies: ["InfrastructureInterface"]),
    ]
)
