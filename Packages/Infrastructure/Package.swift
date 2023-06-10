// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Infrastructure",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "ItemsApiClient",
            targets: ["ItemsApiClient"]
        ),
    ],
    dependencies: [
        .package(name: "Entity", path: "../Entity"),
        .package(name: "InfrastructureInterface", path: "../InfrastructureInterface"),
    ],
    targets: [
        .target(
            name: "ApiRequester",
            dependencies: [
                .product(name: "InfrastructureInterface", package: "InfrastructureInterface"),
            ]
        ),
        .testTarget(
            name: "ApiRequesterTests",
            dependencies: ["ApiRequester"]
        ),
        .target(
            name: "ItemsApiClient",
            dependencies: [
                "ApiRequester",
                .product(name: "Entity", package: "Entity"),
                .product(name: "InfrastructureInterface", package: "InfrastructureInterface"),
            ]
        ),
        .testTarget(
            name: "ItemsApiClientTests",
            dependencies: ["ItemsApiClient"]
        ),
    ]
)
