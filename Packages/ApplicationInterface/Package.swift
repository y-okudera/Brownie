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
    ],
    targets: [
        .target(
            name: "ApplicationInterface",
            dependencies: [
                .product(name: "Entity", package: "Entity"),
            ]
        ),
        .testTarget(
            name: "ApplicationInterfaceTests",
            dependencies: ["ApplicationInterface"]),
    ]
)
