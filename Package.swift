// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "EssentialDeveloper-EssentialProject-EssentialFeediOS", // Matches the name of the repository! Preferably avoid long names and special chars (like "-"). However it works
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "EssentialFeediOS",
            targets: ["EssentialFeediOS"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/sharaev-vl/EssentialDeveloper-EssentialProject-EssentialFeed.git",
            exact: "2.0.6"
        )
    ],
    targets: [
        .target(
            name: "EssentialFeediOS",
            dependencies: [ // It could've been `dependencies: ["EssentialFeed"]`, but since the package and product names are different, we need to specify each name separately
                .product(
                    name: "EssentialFeed",
                    package: "EssentialDeveloper-EssentialProject-EssentialFeed"
                )
            ]
        ),
        .testTarget(
            name: "EssentialFeediOSTests",
            dependencies: ["EssentialFeediOS"]
        ),
    ]
)
