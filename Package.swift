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
  targets: [
    .target(
      name: "UnityAdapterTarget",
      dependencies: [
        .target(name: "UnityAdapter"),
      ],
      path: "UnityAdapterTarget"
    ),
    .binaryTarget(
      name: "UnityAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/unity/UnityAdapter-4.16.4.0.zip",
      checksum: "fa3835fd16430c37c8d2d71d6ac2ed821baf0dfd72c4faf8a902b373281cb1b4"
    ),
    .binaryTarget(
      name: "UnityAds",
      url:
        "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.16.4/UnityAds.zip",
      checksum: "ddc08bb10f636d51c3fe3d73a38c937ea4b0e13c177dd661ad6826f1e72e8e69"
    ),
  ]
)
