// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginPackage",
    platforms:  [
        .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LoginPackage",
            targets: ["LoginPackage"]),
    ],  dependencies: [
        // Add NetworkingPackage as a dependency using a relative path
        .package(path: "../NetworkingPackage")  // Adjust the path if needed
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LoginPackage",
            dependencies: [
                "NetworkingPackage"  // Add NetworkingPackage to the target dependencies
            ]
        ),
        .testTarget(
            name: "LoginPackageTests",
            dependencies: ["LoginPackage"]),
    ]
)

