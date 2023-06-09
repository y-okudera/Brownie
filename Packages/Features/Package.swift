// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Features",
            targets: [
                "Features",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/uber/needle.git",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "Features",
            dependencies: [
                .product(
                    name: "NeedleFoundation",
                    package: "needle"
                )
            ]
        ),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["Features"]),
    ]
)
