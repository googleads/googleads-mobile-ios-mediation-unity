// swift-tools-version:5.3

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
      targets: ["UnityAdapterTarget", "UnityAds"]
    )
  ],
  dependencies: [
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
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "UnityAdapterTarget"
    ),
    .binaryTarget(
      name: "UnityAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/unity/UnityAdapter-4.18.1.0.zip",
      checksum: "4dc652078816f0ba2c21b9e504ea72dee7cd56720f1543db86865a0ff362a52b"
    ),
    .binaryTarget(
      name: "UnityAds",
      url:
        "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.18.1/UnityAds.zip",
      checksum: "62cac3d0df3c8e0106f364f0e456f4edb42b6364dd9dc44b1d13985f70c2fbd1"
    ),
  ]
)
