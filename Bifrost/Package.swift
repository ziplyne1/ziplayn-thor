// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Bifrost",
    platforms: [
        .macOS(.v13)
    ],
    targets: [
        .executableTarget(
            name: "Bifrost",
            path: "Sources"
        )
    ]
)