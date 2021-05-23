// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "apple-tools",
  platforms: [
    .macOS(.v11)
  ],
  products: [
    .executable(
      name: "itunes-duplicates",
      targets: ["itunes-duplicates"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "itunes-duplicates",
      dependencies: [])
  ]
)
