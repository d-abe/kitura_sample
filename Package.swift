import PackageDescription

let package = Package(
    name: "kitura_sample",
    dependencies: [
            .Package(url: "https://github.com/IBM-Swift/Kitura-router.git", majorVersion: 0),
            .Package(url: "https://github.com/d-abe/LithiumLogger.git", majorVersion: 0),
            .Package(url: "https://github.com/qutheory/fluent.git", majorVersion: 0),
            .Package(url: "https://github.com/qutheory/fluent-postgresql.git", majorVersion: 0),
    ],
    testDependencies: [
            .Package(url: "https://github.com/kylef/spectre-build.git", majorVersion: 0),
    ]
)
