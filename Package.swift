// swift-tools-version:5.4
//
// The `swift-tools-version` declares the minimum version of Swift required to
// build this package. Do not remove it.

import PackageDescription

let package = Package(
  name: "iOSDFULibrary",
  platforms: [
    .macOS(.v10_14),
    .iOS(.v9),
    .watchOS(.v4),
    .tvOS(.v11)
  ],
  products: [
    .library(name: "iOSDFULibrary", targets: ["iOSDFULibrary"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/weichsel/ZIPFoundation",
      .exact("0.9.11")
    )
  ],
  targets: [
    .target(
      name: "iOSDFULibrary",
      dependencies: ["ZIPFoundation"],
      path: "iOSDFULibrary/Classes/"
    ),
    // FIXME: Exclude this target for `watchOS` Simulator, because it fails to
    // compile in Xcode.
    .testTarget(
      name: "Hex2BinConverterTests",
      dependencies: ["iOSDFULibrary"],
      path: "Example/Tests/"
    )
  ],
  swiftLanguageVersions: [.v5]
)
