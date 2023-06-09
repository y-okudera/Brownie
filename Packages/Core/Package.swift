// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Core",
            targets: [
                "Core",
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
            name: "Core",
            dependencies: [
                .product(
                    name: "NeedleFoundation",
                    package: "needle"
                )
            ]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
