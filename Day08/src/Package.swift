// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "day08",
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .executableTarget(
            name: "quest1",
            dependencies: ["Swinject"]),
        .executableTarget(
            name: "quest2",
            dependencies: ["Swinject"]),
    ]
)
