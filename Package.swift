// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "megumi",
    platforms: [
        .macOS(.v10_10),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MegumiLib",
            type: .static,
            targets: ["MegumiLib"]),
        .executable(
            name: "megumi",
            targets: ["megumi"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "megumi",
            dependencies: ["MegumiLib"]),
        .target(
            name: "MegumiLib",
            dependencies: []),
        .testTarget(
            name: "megumiTests",
            dependencies: ["megumi"]),
    ]
)
