// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApplicationInterface",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "ApplicationInterface",
            targets: ["ApplicationInterface"]),
    ],
    dependencies: [
        .package(name: "Entity", path: "../Entity"),
        .package(name: "Buildable", path: "../Buildable"),
        .package(name: "InfrastructureInterface", path: "../InfrastructureInterface"),
    ],
    targets: [
        .target(
            name: "ApplicationInterface",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
                .product(name: "Buildable", package: "Buildable"),
                .product(name: "InfrastructureInterface", package: "InfrastructureInterface"),
            ]
        ),
        .testTarget(
            name: "ApplicationInterfaceTests",
            dependencies: ["ApplicationInterface"]),
    ]
)
