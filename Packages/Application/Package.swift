// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Application",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "SearchItemsInteractor",
            targets: ["SearchItemsInteractor"]),
    ],
    dependencies: [
        .package(name: "ApplicationInterface", path: "../ApplicationInterface"),
        .package(name: "Entity", path: "../Entity"),
        .package(name: "InfrastructureInterface", path: "../InfrastructureInterface"),
    ],
    targets: [
        .target(
            name: "SearchItemsInteractor",
            dependencies: [
                .product(name: "ApplicationInterface", package: "ApplicationInterface"),
                .product(name: "Entity", package: "Entity"),
                .product(name: "InfrastructureInterface", package: "InfrastructureInterface"),
            ]
        ),
        .testTarget(
            name: "SearchItemsInteractorTests",
            dependencies: ["SearchItemsInteractor"]
        ),
    ]
)
