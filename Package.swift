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
      targets: ["itunes-duplicates"]),
    .executable(
      name: "orchid",
      targets: ["orchid"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "itunes-duplicates",
      dependencies: []),
    .target(
      name: "orchid",
      dependencies: [])
  ]
)
