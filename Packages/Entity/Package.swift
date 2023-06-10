// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Entity",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Entity",
            targets: ["Entity"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Entity",
            dependencies: []),
        .testTarget(
            name: "EntityTests",
            dependencies: ["Entity"]),
    ]
)
