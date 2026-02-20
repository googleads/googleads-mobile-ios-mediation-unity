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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/unity/UnityAdapter-4.16.6.1.zip",
      checksum: "3cd5dc6de8448f450ab7c0ca6cd0ede716c9e62b0dc691444bc7684d331c1166"
    ),
    .binaryTarget(
      name: "UnityAds",
      url:
        "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.16.6/UnityAds.zip",
      checksum: "f844ff77d03e07a196557e62cd5f0a46df04bc5029db12dcc63be90f28192e45"
    ),
  ]
)
