// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Bifrost",
    targets: [
        .executableTarget(
            name: "Bifrost",
            path: "Sources"
        )
    ]
)