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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/unity/UnityAdapter-4.16.1.0.zip",
      checksum: "b6e8f98c59ee7517d1da3e8d9b15a9d58232b008ae266743dc6669fcd978f905"
    ),
    .binaryTarget(
      name: "UnityAds",
      url:
        "https://github.com/Unity-Technologies/unity-ads-ios/releases/download/4.16.1/UnityAds.zip",
      checksum: "cb8ba2a90c8f16ccafd5958d4d8457dab578865629dd3aa1ac1fc4677ec9cf54"
    ),
  ]
)
