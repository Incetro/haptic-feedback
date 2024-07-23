// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "haptic-feedback",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HapticFeedback",
            targets: ["HapticFeedback"]),
    ],
    dependencies: [
        .package(url: "https://github.com/devicekit/DeviceKit.git", from: "5.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HapticFeedback",
            dependencies: [
                .product(name: "DeviceKit", package: "DeviceKit")
            ]
        ),
        .testTarget(
            name: "HapticFeedbackTests",
            dependencies: ["HapticFeedback"]),
    ]
)
