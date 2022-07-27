// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FTVFreewheelKit",
    platforms: [
        .iOS(.v10), .tvOS(.v12),
    ],
    products: [
        .library(
            name: "FTVFreewheelLib",
            targets: ["AdManager"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "AdManager",
            path: "AdManager.xcframework"
        ),
    ]
)