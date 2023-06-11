// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "QiitaSearchScreen",
            targets: [
                "QiitaSearchScreen",
            ]
        ),
    ],
    dependencies: [
        .package(name: "ApplicationInterface", path: "../ApplicationInterface"),
        .package(name: "Buildable", path: "../Buildable"),
        .package(name: "PresentationInterface", path: "../PresentationInterface"),
    ],
    targets: [
        .target(
            name: "QiitaSearchScreen",
            dependencies: [
                "Extensions",
                .product(name: "ApplicationInterface", package: "ApplicationInterface"),
                .product(name: "Buildable", package: "Buildable"),
                .product(name: "PresentationInterface", package: "PresentationInterface"),
            ]
        ),
        .testTarget(
            name: "QiitaSearchScreenTests",
            dependencies: [
                "QiitaSearchScreen",
            ]
        ),
        .target(
            name: "Extensions",
            dependencies: []
        ),
    ]
)
