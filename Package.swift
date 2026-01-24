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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/unity/UnityAdapter-4.16.2.0.zip",
      checksum: "f68de07153748728027e41885d6e913a611a4b02d9f9faa92e57a3e18e175b90"
    ),
    .binaryTarget(
      name: "UnityAds",
      url:
        "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.16.2/UnityAds.zip",
      checksum: "178bb4d16a5fef70470c7d4526fbcebdf3baeeb82d5c80ab1fb5d40b419f4e1a"
    ),
  ]
)
