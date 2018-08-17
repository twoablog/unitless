// swift-tools-version:4.0
//
//  Package.swift
//  UsePackageTests(Unitless)
//
//  Created by Tomás Silveira Salles on 17.08.18.
//  Copyright © 2018 TwoA. All rights reserved.
//


import PackageDescription

let package = Package(
    name: "UsePackageTests",
    dependencies: [
		.package(url: "../", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "UsePackageTests",
            dependencies: [
				"Unitless"
			]
		)
    ]
)
