// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "UnityAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "UnityAdapterTarget",
      targets: ["UnityAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git",
      exact: "4.19.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    )
  ],
  targets: [
    .target(
      name: "UnityAdapterTarget",
      dependencies: [
        .target(name: "UnityAdapter"),
        .product(name: "UnityAds", package: "Unity-Ads-Swift-Package"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "UnityAdapterTarget"
    ),
    .binaryTarget(
      name: "UnityAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/unity/UnityAdapter-4.19.0.1.zip",
      checksum: "18db0a99e3b09f30511ec21b0bd013751fb9fcc3457230479d230faf478895b1"
    ),
  ]
)
