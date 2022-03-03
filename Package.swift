// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Driftwood",
    platforms: [
        .iOS(.v8), .macOS(.v10_11), .tvOS(.v9)
    ],
    products: [
        .library(name: "Driftwood", targets: ["Driftwood"])
    ],
    targets: [
        .target(name: "Driftwood", dependencies: [])
    ]
)
