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
            name: "QiitaSearch",
            targets: [
                "QiitaSearch",
            ]
        ),
    ],
    dependencies: [
        .package(name: "Core", path: "../Core"),
        .package(url: "https://github.com/uber/needle.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "QiitaSearch",
            dependencies: [
                "PresentationCore",
                .product(name: "Core", package: "Core"),
                .product(name: "NeedleFoundation", package: "needle"),
            ]
        ),
        .testTarget(
            name: "QiitaSearchTests",
            dependencies: [
                "QiitaSearch",
            ]
        ),
        .target(
            name: "PresentationCore",
            dependencies: []
        )
    ]
)
