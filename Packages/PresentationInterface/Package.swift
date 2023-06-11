// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationInterface",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "PresentationInterface",
            targets: ["PresentationInterface"]),
    ],
    dependencies: [
        .package(name: "Buildable", path: "../Buildable"),
    ],
    targets: [
        .target(
            name: "PresentationInterface",
            dependencies: [
                .product(name: "Buildable", package: "Buildable"),
            ]
        ),
        .testTarget(
            name: "PresentationInterfaceTests",
            dependencies: ["PresentationInterface"]),
    ]
)
