// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ALWebViewController",
    products: [
        .library(
            name:"ALWebViewController",
            targets: ["ALWebViewController"]
        )
    ],
    targets: [
        .target(
            name: "ALWebViewController",
            path: "ALWebViewController"
        )
    ]
)
