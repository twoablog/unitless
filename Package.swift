// swift-tools-version:4.0
//
//  Package.swift
//  Unitless
//
//  Created by Tomás Silveira Salles on 14.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "Unitless",
    products: [
        .library(
            name: "Unitless",
            targets: [
				"Unitless"
			]
		)
    ],
    targets: [
        .target(
            name: "Unitless",
			path: "Unitless"
		),
        .testTarget(
            name: "UnitlessTests",
            dependencies: [
				"Unitless"
			],
			path: "UnitlessTests"
		)
    ]
)
