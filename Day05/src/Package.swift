// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "day05",
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0"))
  ],
  targets: [
    .target(name: "quest1", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest2", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest3", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest4", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest5", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest6", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest7", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest8", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest9", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    .target(name: "quest10", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
  ]
)
