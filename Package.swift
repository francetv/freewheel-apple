// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "FTVFreewheelKit",
    platforms: [
        .iOS(.v10),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "FTVFreewheelLib", targets: ["AdManager"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "AdManager", path: "AdManager.xcframework")
    ]
)