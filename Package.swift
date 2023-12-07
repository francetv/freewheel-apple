// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "FTVFreewheelKit",
    platforms: [
        .iOS(.v10), .tvOS(.v12),
    ],
    products: [
        .library(name: "FTVFreewheelLib-iOS", targets: ["AdManager-iOS"]),
        .library(name: "FTVFreewheelLib-tvOS", targets: ["AdManager-tvOS"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "AdManager-iOS", path: "iOS/AdManager.xcframework"),
        .binaryTarget(name: "AdManager-tvOS", path: "tvOS/AdManager.xcframework")
    ]
)