// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MMAlgorithms",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(name: "MMAlgorithms", targets: ["MMAlgorithms"]),
    ],
    targets: [
        .target(name: "MMAlgorithms"),
        .testTarget(name: "MMAlgorithmsTests", dependencies: ["MMAlgorithms"]),
    ]
)
